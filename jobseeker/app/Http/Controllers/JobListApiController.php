<?php

namespace App\Http\Controllers;

use App\Models\Job;
use Illuminate\Http\Request;

class JobListApiController extends Controller
{
    public function index()
    {
      $jobs=Job::all();
      return response()->json(['message'=>'sukses','data'=>$jobs]);
    }
    public function store(Request $request)
    {
        $job=Job::create($request->all());
        return response()->json(array(['data' => $job]));
    }
    public function show($id)
    {
        $job=Job::find($id);
        return response()->json(array(['data' => $job]));
    }
    public function edit(Request $request, $id)
    {
        $job=Job::find($id);
        $job->update($request->all());
        return response()->json(array(['data' => $job]));
    }
}
