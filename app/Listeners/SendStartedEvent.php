<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\EndpointCallback\Callback;
use App\Events\StartedEvent;
class SendStartedEvent
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
    public function handle(StartedEvent $event): void
    {
        Callback::subscriptionStatusChanged($event->device, $event->app, "cancelled");
    }
}
