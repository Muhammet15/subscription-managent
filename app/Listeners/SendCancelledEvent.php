<?php

namespace App\Listeners;


use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\EndpointCallback\Callback;
use App\Events\CancelledEvent;
class SendCancelledEvent
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(CancelledEvent $event): void
    {
        Callback::subscriptionStatusChanged($event->device, $event->app, "cancelled");
    }
}
