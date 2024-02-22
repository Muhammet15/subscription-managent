<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FailedJob extends Model
{
    use HasFactory;
    protected $fillable = ['subscription_id', 'err_code', 'retry_count', 'failed_at'];

    public function subscription()
    {
        return $this->belongsTo(Subscription::class);
    }
}
