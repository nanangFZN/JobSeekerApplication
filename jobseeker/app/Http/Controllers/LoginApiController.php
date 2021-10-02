<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LoginApiController extends Controller
{
    public function postlogin(Request $request)
    {
        if (Auth::attempt(
            [
            'email'=>$request->email,
            'password'=>$request->password
            ]
            )) {
           $user=Auth::user();
           $token=Str::random(60);
           $data['user']=$user;
           $data['token']=$token;
         
            return response()->json([
               
                'data'=>$data,
                'pesan'=>'Login Berhassil'
            ],200);
        }
        return response()->json([
            
            'data'=>'',
            'pesan'=>'Login Gagal'
        ],401);
    }

    public function postregister(Request $request)
    {
        $skill=$request->input('skills');
        $user=[
            'name'=>$request->name,
            'phonenumber'=>$request->phonenumber,
            'email'=>$request->email,
            'address'=>$request->address,
            'education'=>$request->education,
            'skills'=>json_encode([$skill]),
            'remember_token'=>Str::random(60),
            'password'=>bcrypt($request->input('password')),
        ];
      
        User::insert([$user]);
        return response()->json(['message'=>'User Has Been Registered','data'=>$user],200);
    } 

    public function favorite(Request $request)
    {
      $favorite = Favorite::create($request->all());
        return response()->json(['data'=>$favorite]);
    }
    public function showfav(Request $request , $id)
    {
       //$data=Favorite::find($id);
       $d =DB::table('jobs')->join('favorites','jobs.id','=','favorites.id_job')->where('id_user','=',$id)->get();
        return response()->json(['data'=>$d]);
    }
}
