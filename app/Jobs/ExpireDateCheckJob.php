<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Subscription;
use App\Models\Purchase;
use App\Helpers\verifyMock;
use App\Services\MockApiServices;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use App\Models\FailedJob;
use App\Jobs\ExpireDateCheckRetryJob;

class ExpireDateCheckJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;


    public function __construct()
    {

    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): void
    {
        $mockApiService = new MockApiServices();
        Subscription::where('expire_date', '<', now())
            ->whereIn('status', ['started', 'renewed' , 'expired'])
            ->chunk(500, function ($expiredSubscriptions) use ($mockApiService) {
                foreach ($expiredSubscriptions as $subscription) {
                    $purchase = Purchase::create([
                        'device_id' => $subscription->device_id,
                        'receipt' =>$subscription->receipt,
                    ]);
                    try {
                        $verificationResult = null;
                        if ($subscription->device->os == 'ios') {
                            $verificationResult = $mockApiService->iosMockApi($subscription->receipt);
                        } else {
                            $verificationResult = $mockApiService->googleMockApi($subscription->receipt);
                        }
                        if ($verificationResult['status']) {
                            $subscription->update([
                                'status' => 'renewed',
                                'expire_date' => now()->addMonth(),
                            ]);
                        } else if ($verificationResult['err_code']) {
                            Log::info('Error code received for subscription ID ' . $subscription->id . ': ' . $verificationResult['err_code']);
                            $failedSubscription = FailedJob::where('subscription_id', $subscription->id)
                                ->where('err_code', $verificationResult['err_code'])->first();
                            if (!$failedSubscription) {
                                $failedSubscription = new FailedJob;
                                $failedSubscription->subscription_id = $subscription->id;
                                $failedSubscription->err_code = $verificationResult['err_code'];
                                $failedSubscription->retry_count = 0;
                            }
                            $failedSubscription->retry_count++;
                            $failedSubscription->save();
                            ExpireDateCheckRetryJob::dispatch($failedSubscription)->onQueue('retry_queue')->delay(now()->addMinutes(1));
                        continue;
                        } else {
                            $subscription->update([
                                'status' => 'expired',
                            ]);
                        }
                    } catch (\Exception $e) {
                        Log::error('Error processing subscription: ' . $e->getMessage());
                    }
                }
            });
    }

}
