<?php

use App\Http\Controllers\JobListApiController;
use App\Http\Controllers\LoginApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('/job',[JobListApiController::class,'index']);
Route::post('/job',[JobListApiController::class,'store']);
Route::get('/job/{id}',[JobListApiController::class,'show']);
Route::put('/job/{id}',[JobListApiController::class,'edit']);
Route::delete('/job/{id}',[JobListApiController::class,'delete']);
Route::post('/postlogin',[LoginApiController::class,'postlogin']);
Route::post('/postregister',[LoginApiController::class,'postregister']);
Route::post('/favorite',[LoginApiController::class,'favorite']);
Route::get('/favorite/{id}',[LoginApiController::class,'showfav']);