<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function create()
    {
        return view('pages.user_create');
    }
    public function store(Request $request)
    {
        $random = Str::random(40);
        $data=[
            'name'=>$request->input('name'),
            'phonenumber'=>$request->input('phonenumber'),
            'education'=>$request->input('education'),
            'address'=>$request->input('address'),
           
            'skills'=>$request->input('skills'),
            'email'=>$request->input('email'),
            'password'=>bcrypt($request->input('password')),
            'remember_token'=>$random
        ];
        //dd($data);
        $user=User::create($data);
        return redirect('/');
    }
}
