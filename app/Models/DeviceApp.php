<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceApp extends Model
{
    use HasFactory;
    protected $fillable = ['device_id','app_id'];
}
