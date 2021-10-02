<h1>Add Job</h1>
<form method="post" action="/job/{{$data->id}}/edit">
@method('PUT')
@csrf
<?php
$require=json_decode($data->requirement,true);
$count=count($require);
?>
    
    
Perusahaan<br>
<input type="text" name="perusahaan" value="{{$data->perusahaan}}"><br>
Position<br>
<input type="text" name="position" value="{{$data->position}}"><br>
Salary<br>
<input type="text" name="salary" value="{{$data->salary}}"><br>
Kota<br>
<input type="text" name="alamat" value="{{$data->alamat}}"><br>
Desk data<br>
<input type="text" name="deskjob" value="{{$data->deskjob}}"><br>
Requirements<br>
@for ($i=0;$i<$count;$i++)
    <input type="text" name="requirement[]" value="{{$require[$i]}}"><br>
@endfor

<input type="submit" value="Simpan">
</form>

