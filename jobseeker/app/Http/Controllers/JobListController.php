<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\User;
use App\Models\Job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JobListController extends Controller
{
    public function index()
    {   
        $jobs=Job::all();
        $users=User::all();
        $data = DB::table('favorites')
        ->join('jobs', 'favorites.id_job', '=', 'jobs.id')
        ->join('users','favorites.id_user','=','users.id') 
        ->get();

        return view('pages.index',['jobs'=>$jobs,'user'=>$users,'favorites'=>$data]);
    }
    public function create()
    {
        return view('pages.create_job');
    }
    public function store(Request $request)
    {
       // dd($request->all());
       $require=$request->input('requirement'); 
       $count=count($require);
       for ($i=0; $i < $count ; $i++) { 
          //print_r($require[$i]);
          $r=$require[$i];
          print_r(json_encode($r));
       }
       $data=[
            'perusahaan'=>$request->input('perusahaan'),
            'alamat'=>$request->input('alamat'),
            'salary'=>$request->input('salary'),
            'position'=>$request->input('position'),
            'deskjob'=>$request->input('deskjob'),
            'requirement'=>json_encode($require)
        ] ;
       
       
       Job::insert([$data]);
        
        return redirect('/');
    }
    public function show($id)
    {
       
        $job=Job::findOrFail($id);
       // $data=json_decode($job->requirement,true);
    
        return view('pages.edit',['data'=>$job]);
    }
    public function edit(Request $request,$id)
    {
        
        $req=$request->input('requirement');
        $count=count($req);
        $hasil=[];
       
        for ($i=0; $i < $count; $i++) { 
            $hasil=$req;
            
        }
        $data=[
            'perusahaan'=>$request->input('perusahaan'),
            'alamat'=>$request->input('alamat'),
            'salary'=>$request->input('salary'),
            'position'=>$request->input('position'),
            'deskjob'=>$request->input('deskjob'),
            'requirement'=>json_encode($hasil)
        ];
        //atas udah bener tinggal input edit nya
        $job=Job::find($id);
        $job->update($data);
        return redirect('/');
    }
    public function delete( $id)
    {
        $job=Job::find($id);
        $job->delete();
        return redirect('/');
    }
    public function favorite($id)
    {
        $job=Job::find($id);
        $data=[
            'id_user'=>1,
            'id_job'=>$job['id'] 
        ];
       Favorite::insert($data);
        return redirect('/');
    }
}
