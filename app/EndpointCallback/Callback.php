<?php

namespace App\EndpointCallback;
use Illuminate\Support\Facades\Http;

class Callback
{
    public static function subscriptionStatusChanged($device,$app, $eventName)
    {
        try {
            $response = Http::post($app->endpoint, [
                'appId,' => $app->id,
                'deviceID' => $device->id,
                'event' => $eventName,
            ]);
            if ($response->successful()) {
                return $response;
            } else {
                return "app->enpoint is not reachable";
            }
        } catch (\Throwable $th) {
            \Log::info('Post  request failed because app->enpoint ' . $app->endpoint . ' is not reachable');
        }


    }
}
