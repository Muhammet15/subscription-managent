<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::namespace('App\Http\Controllers\Api')->group(function () {
    Route::post('/register', 'AuthController@register');
});


Route::namespace('App\Http\Controllers\Api')->middleware('auth:sanctum')->group(function () {

    Route::prefix('purchase')->group(function () {
        Route::post('/', 'PurchaseController@purchase');
    });

    Route::prefix('subscriptions')->group(function () {
        Route::get('/', 'SubscriptionController@mySubscriptions');
        Route::get('/{app_id}', 'SubscriptionController@getMyPlan');
        Route::get('/{subscription_id}/detail', 'SubscriptionController@getPlanDetail');
        Route::get('/{subscription_id}/cancel', 'SubscriptionController@cancelSubscription');

    });
});

