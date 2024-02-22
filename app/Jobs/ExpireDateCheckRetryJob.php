<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\Subscription;
use App\Models\FailedJob;
use App\Services\MockApiServices;
use App\Jobs\ExpireDateCheckRetryJob;

const MAX_RETRIES = 10;

class ExpireDateCheckRetryJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $failedSubscription;

    public function __construct($failedSubscription)
    {
        $this->failedSubscription = $failedSubscription;
    }

    public function handle(): void
    {
        $mockApiService = new MockApiServices();
        $subscription = Subscription::find($this->failedSubscription['subscription_id']);

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
        } else {
            if ($this->failedSubscription['retry_count'] < MAX_RETRIES) { //MAX_RETRIES
                $this->failedSubscription['retry_count']++;

                FailedJob::where('id', $this->failedSubscription['id'])->update([
                    'retry_count' => $this->failedSubscription['retry_count'],
                ]);
                ExpireDateCheckRetryJob::dispatch($this->failedSubscription)->onQueue('retry_queue');
            } else {
                $subscription->update([
                    'status' => 'expired',
                ]);
            }
        }
    }
}
