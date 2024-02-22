<?php

namespace App\Http\Controllers\Api;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Http\Resources\RegisterResource;
use App\Traits\ApiResponse;
use App\Models\Device;

class AuthController extends Controller
{
    use ApiResponse;

    public function register(RegisterRequest $request)
    {
        $device = Device::where('uid', $request->uid)->first();
        if (!$device) {
            $device = Device::create($request->all());
            $device->deviceApps()->create(['app_id' => $request->appId]);
            $message = "Register Device OK";
        } else if (!$device->deviceApps()->where('app_id',$request->appId)->exists()) {
            $device->deviceApps()->create(['app_id' => $request->appId]); //isteğe bağlı
            $message = "AppId Register OK!";
        }else {
            return $this->successResponse(true, 'Register OK', (object) []);
        }
        $clientToken = $device->createToken('client_token')->plainTextToken;
        return $this->successResponse(true, $message,  [
            'device' => new RegisterResource($device),
            'client_token' => $clientToken,
        ]);
    }


}
