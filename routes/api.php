<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\api\TodosController;

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

//todo app routes
Route::get('todos', [TodosController::class, 'index'])->name('todo.home');
Route::post('todos', [TodosController::class, 'store'])->name('todo.store');
Route::get('show/{id}', [TodosController::class, 'show'])->name('todo.show');
Route::post('todos/{id}', [TodosController::class, 'update'])->name('todo.update');
Route::any('todos/{id}', [TodosController::class, 'destroy'])->name('todo.destroy');


Route::middleware('auth:sanctum')->prefix('auth')->group(function () {
    Route::get('/users', [AuthController::class, 'index']);
    Route::get('/current_user', [AuthController::class, 'me']);
});
