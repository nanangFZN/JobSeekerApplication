<h1>Home</h1>
<a href="/job/create">Add Job</a>
<a href="/job/user/create">Add User</a>
<a href="/login">Login</a>
<table>

    <thead>
        <tr>        
        <th>Perusahaan</th>
        <th>Kota</th>
        <th>Position</th>
        <th>Salary</th>
        <th>DeskJob</th>
        <th>Requirements</th>
        <th>Action</th>
        </tr>
    </thead>
    <tbody>
    @foreach ($jobs as $item )
        <?php
         $require=json_decode($item->requirement,true); 
         //dd($require);
         $count=count($require);
         //dd($count);
         
        ?>
         <tr>
        <td>{{$item->perusahaan}}</td>
        <td>{{$item->alamat}}</td>
        <td>{{$item->position}}</td>
        <td>{{$item->salary}}</td>
        <td>{{$item->deskjob}}</td>
        <td>
        @for ($i=0;$i<$count;$i++)
          {{$require[$i]}}
        @endfor
        </td>
        <td><a href="/job/{{$item->id}}/show">Edit</a></td>
        
           <td>
           <form method="POST" action="/job/{{$item->id}}">
            @method('DELETE')
            @csrf
           <a href="/job/{{$item->id}}">DELETE</a>
            </form>
           </td> 
           <td><a href="/job/{{$item->id}}">Simpan</a></td>
           
       
        </tr>
    @endforeach   
    </tbody>
</table>



<table>
    <thead>
        <tr>        
        <th>Nama</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Skills</th>
        <th>Action</th>
        </tr>
    </thead>
    <tbody>
    @foreach ($user as $item )
        <?php
         $require=json_decode(json_encode($item->skills),true); 
         //dd($require);
         $c=count($require);
         //dd($count);
         
        ?>
         <tr>
        <td>{{$item->name}}</td>
        <td>{{$item->phonenumber}}</td>
        
        <td>{{$item->email}}</td>
        
        <td>@for ($i=0;$i<$c;$i++)
            {{$require[$i]}}
        @endfor</td>
        <td><a href="/job/user/{{$item->id}}/show">Edit</a></td>
        
           <td>
           <form method="POST" action="/job/user/{{$item->id}}">
            @method('DELETE')
            @csrf
           <a href="/job/{{$item->id}}">DELETE</a>
            </form>
           </td> 
         
       
        </tr>
    @endforeach   
    </tbody>

<br><br?


    <thead>
        <tr>        
        <th>Nama User</th>
        <th>PT</th>
        <th>Kota</th>
        <th>Salary</th>
        </tr>
    </thead>
    <tbody>
    @foreach ($favorites as $item )
       
         <tr>
        <td>{{$item->name}}</td>
        <td>{{$item->perusahaan}}</td>
        <td>{{$item->alamat}}</td>
        <td>{{$item->salary}}</td>
        <td>
      
        </tr>
    @endforeach   
    </tbody>
</table>
