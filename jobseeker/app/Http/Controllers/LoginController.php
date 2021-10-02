<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class LoginController extends Controller
{
    public function login()
    {
        return view('pages.login');
    }
    public function postlogin(Request $request)
    {
       if (Auth::attempt($request->only('email','password'))) {
           return redirect('/');
       }
       return redirect('/login')->withErrors([
        'approve' => 'Wrong password or this account not approved yet.',
    ]);
    }
}
