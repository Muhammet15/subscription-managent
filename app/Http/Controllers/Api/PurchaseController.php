<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Device;
use App\Models\Subscription;
use App\Models\Purchase;
use App\Http\Requests\PurchaseRequest;
use App\Http\Resources\SubscriptionResource;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\Http;
use App\Helpers\Mockapi;
use App\Services\MockApiServices;
use App\Events\StartedEvent;
class PurchaseController extends Controller
{
    use ApiResponse;

    public function purchase(PurchaseRequest $request, MockApiServices $mockApiService)
    {
        $device = auth()->user();
        $purchase = Purchase::create([
            'device_id' => $device->id,
            'receipt' => $request->receipt,
        ]);
        if (!$device->deviceApps()->where('app_id', $request->app_id)->exists()) {
            return $this->errorResponse(false, 'Device is not associated with the specified app_id');
        }
        $verificationResult = $device->os == 'ios'
            ? $mockApiService->iosMockApi($purchase->receipt)
            : $mockApiService->googleMockApi($purchase->receipt);
        $result = null;
        if ($verificationResult['status']) {
            $subscriptionData = [
                'receipt' => $request->receipt,
                'expire_date' => $verificationResult['expire_date'],
            ];
            $baseQuery = Subscription::where('device_id', $device->id)
                ->where('app_id', $request->app_id);
            $existingActiveSubscription = $baseQuery->where('status', 'started')->first();
            if (!$existingActiveSubscription) {
                $existingSubscription = $baseQuery->whereIn('status', ['renewed', 'cancelled'])->first();
                if ($existingSubscription) {
                    event(new RenewedEvent($result->device, $result->app));  // App endpoint url is not available but event-listen-callback is working.
                    $result = $existingSubscription->update($subscriptionData);
                } else {
                    $result = Subscription::create([
                        'device_id' => $device->id,
                        'app_id' => $request->app_id,
                        'status' => 'started',
                    ] + $subscriptionData);
                    event(new StartedEvent($result->device, $result->app));  // App endpoint url is not available but event-listen-callback is working.
                }
            }
            } elseif ($verificationResult['err_code']) {
                return $this->errorResponse(false, $verificationResult['err_code']);
            } else {
                return $this->errorResponse(false, 'Purchase Transactions Failed!');
            }

        return $result instanceof Subscription
            ? $this->successResponse(true, 'Purchase processed successfully', new SubscriptionResource($result))
            : $this->successResponse(true, 'You have already active sub', (object) []);

    }

}
