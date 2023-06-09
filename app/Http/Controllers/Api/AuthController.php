<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    /**
     * Create User
     * @param Request $request
     * @return User
     */
    public function register(Request $request)
    {
        try {
            //Validated
            $validateUser = Validator::make(
                $request->all(),
                [
                    'name' => 'required|string',
                    'phone' => 'required|string|max:20',
                    'email' => 'required|email|unique:users,email',
                    'county' => 'required|string|max:20',
                    'subcounty' => 'required|string|max:20',
                    'residence' => 'required|string|max:20',
                    'password' => 'required|confirmed',

                ]
            );

            if ($validateUser->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 500);
            }

            $user = User::create([
                'name' => $request->name,
                'phone' => $request->phone,
                'email' => $request->email,
                'county' => $request->county,
                'subcounty' => $request->subcounty,
                'residence' => $request->residence,
                'password' => Hash::make($request->password)
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User Created Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage(),
                'errors' => null,
            ], 500);
        }
    }

    /**
     * Login The User
     * @param Request $request
     * @return User
     */
    public function login(Request $request)
    {

        $validateUser = Validator::make(
            $request->all(),
            [
                'email' => 'required|email|exists:users,email',
                'password' => 'required'
            ]
        );

        if ($validateUser->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'validation error',
                'errors' => $validateUser->errors()
            ], 500);
        }

        try {
            if (!Auth::attempt($request->only(['email', 'password']))) {
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid Login Credentials',
                ], 500);
            }

            $user = User::where('email', $request->email)->first();

            return response()->json([
                'status' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage(),
                'errors' => null,
            ], 500);
        }
    }

    public function me()
    {
        return response()->json([
            'status' => true,
            'message' => 'User retrieved Successfully',
            'data' => Auth::user(),
        ]);
    }

    public function index()
    {
        $users = User::all();
        return Response::json([
            'status' => true,
            'message' => $users
        ]);
    }

    public function logout()
    {
        $user = Auth::user();
        Auth::logout($user);
        return response()->json([
            'status' => 'true',
            'message' => 'Log Out successfully',
            'errors' => null,
        ]);
    }
}
