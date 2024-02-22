<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SubscriptionDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'device' =>  [
                'device_id' => $this->device->id,
                'uid' => $this->device->uid,
                'language' => $this->device->language,
                'os' => $this->device->os,
            ],
            'app' => [
                'app_id' => $this->app->id,
                'name' => $this->app->name,
                'endpoint' => $this->app->endpoint,
            ],
            'status' => $this->status ?? 'started',
            'expire_date' => $this->expire_date,
            'receipt' => $this->receipt,
        ];
    }
}
