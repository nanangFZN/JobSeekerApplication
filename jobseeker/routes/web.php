<?php

use App\Http\Controllers\JobListController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/login',[LoginController::class,'login']);
Route::post('/postlogin',[LoginController::class,'postlogin']);

//JOB CONTROLLER
Route::get('/',[JobListController::class,'index']);
Route::get('/job/create',[JobListController::class,'create']);
Route::post('/job/store',[JobListController::class,'store']);
Route::get('/job/{id}/show',[JobListController::class,'show']);
Route::put('/job/{id}/edit',[JobListController::class,'edit']);
Route::get('/job/{id}',[JobListController::class,'delete']);
Route::get('/job/{id}',[JobListController::class,'favorite']);


Route::get('/job/user/create',[UserController::class,'create']);
Route::post('job/user/store',[UserController::class,'store']);