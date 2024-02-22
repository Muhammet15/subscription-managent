<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SubscriptionResource extends JsonResource
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
            'device_id' => $this->device_id,
            'app_id' => $this->app_id,
            'status' => $this->status ?? 'started',
            'expire_date' => $this->expire_date,
            'receipt' => $this->receipt,
        ];
    }
}
