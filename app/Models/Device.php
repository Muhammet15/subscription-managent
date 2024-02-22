<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class Device extends Model
{
    use HasFactory, HasApiTokens;

    protected $fillable = ['uid', 'language', 'os'];

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class);
    }

    public function deviceApps()
    {
        return $this->hasMany(DeviceApp::class);
    }
}
