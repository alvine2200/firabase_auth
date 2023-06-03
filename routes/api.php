<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;

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

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::any('/logout', [AuthController::class, 'logout']);

Route::middleware('auth:sanctum')->prefix('auth')->group(function () {
    Route::get('/users', [AuthController::class, 'index']);
    Route::get('/current_user', [AuthController::class, 'me']);
});
