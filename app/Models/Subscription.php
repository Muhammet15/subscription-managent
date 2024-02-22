<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    use HasFactory;

    protected $fillable = ['device_id', 'status', 'expire_date' ,'receipt', 'app_id'];

    public function device()
    {
        return $this->belongsTo(Device::class);
    }

    public function app()
    {
        return $this->belongsTo(App::class);
    }
    public function failedJobs()
    {
        return $this->hasMany(FailedJob::class);
    }
}
