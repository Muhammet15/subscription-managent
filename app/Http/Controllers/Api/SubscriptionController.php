<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subscription;
use App\Http\Resources\SubscriptionResource;
use App\Http\Resources\SubscriptionDetailResource;
use App\Traits\ApiResponse;
use App\Events\CancelledEvent;
class SubscriptionController extends Controller
{
    use ApiResponse;

    public function mySubscriptions()
    {
        $deviceId = auth()->user()->id;
        $subscriptions = Subscription::where('device_id', $deviceId)->get();
        if ($subscriptions){
            return $this->successResponse(true, 'Subscriptions found', SubscriptionResource::collection($subscriptions));
        } else {
            return $this->successResponse(true, 'You have not subscribed to any yet.', [] );
        }
    }

    public function getMyPlan($app_id){
        $deviceId = auth()->user()->id;
        $subscription = Subscription::where('device_id', $deviceId)->where('app_id', $app_id)->first();
        if ($subscription){
            return $this->successResponse(true, 'Subscription found', new SubscriptionDetailResource($subscription));
        } else {
            return $this->errorResponse(false, 'Subscription not found', [], 404);
        }
    }

    public function getPlanDetail($subscription_id){
        $subscription = Subscription::find($subscription_id);
        if ($subscription){
            return $this->successResponse(true, 'Subscription found', new SubscriptionDetailResource($subscription));
        } else {
            return $this->errorResponse(false, 'Subscription not found', [], 404);
        }
    }

    public function cancelSubscription($subscription_id){
        $subscription = Subscription::find($subscription_id);
        if ($subscription){
            $subscription->status = 'cancelled';
            $subscription->expire_date = now();
            $subscription->save();
            event(new CancelledEvent($subscription->device, $subscription->app)); // App endpoint url is not available but event-listen-callback is working.
            return $this->successResponse(true, 'Subscription cancelled', (object) []);
        } else {
            return $this->errorResponse(false, 'Subscription not found', [], 404);
        }
    }
}
