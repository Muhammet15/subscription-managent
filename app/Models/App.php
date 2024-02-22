<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class App extends Model
{
    use HasFactory;
    protected $tablename = 'apps';

    protected $fillable = [
        'name',
        'endpoint'
    ];

    public function devices()
    {
        return $this->belongsToMany(Device::class, 'device_apps');
    }
}
