<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Todo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TodosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $todos = Todo::all();
        return response()->json([
            'status' => 'true',
            'message' => 'todos fetched successfully',
            'data' => $todos,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required|string'
        ]);

        if ($validate->fails()) {
            return response()->json([
                'status' => 'false',
                'message' => 'validation error',
                'errors' => $validate->errors(),
            ]);
        }

        $todo = Todo::create([
            'name' => $request->name,
            'completed' => $request->completed,
        ]);

        return response()->json([
            'status' => 'true',
            'message' => 'Todo created successfully',
            'data' => $todo,
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $todo = Todo::find($id);
        return response()->json([
            'status' => 'false',
            'message' => 'validation error',
            'data' => $todo,
        ]);
    }


    // 

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $todo = Todo::find($id);
        $todo->update([
            'name' => $request->name,
            'completed' => $request->completed,
        ]);
        return response()->json([
            'status' => 'true',
            'message' => 'todo successfully update',
            'data' => $todo,
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $todo = Todo::find($id)->delete();
        return response()->json([
            'status' => 'true',
            'message' => 'todo deleted successfully',
            'data' => $todo,
        ], 200);
    }
}
