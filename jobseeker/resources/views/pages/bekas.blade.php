



<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel 8 </title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
      .container {
            max-width: 600px;
        }
    </style>
</head>

<body>



<br><br><br>
<h1>Tambah User</h1>
<form method="POST" action="/job/user/store" id="kotak">
@csrf
Nama<br>
<input type="text" name="name"><br>
Phone<br>
<input type="text" name="phonenumber"><br>
Address<br>
<input type="text" name="address"><br>
Email<br>
<input type="text" name="email"><br>
Last Education<br>
<input type="text" name="education"><br>
Skills<br>
<input type="text" name="skills[]">
<button id="add" class="add">tambah</button><br>
Password<br>
<input type="password" name="password"><br>
<input type="submit" value="Simpan">
</form>




<script>
$(document).ready(function(){
	$('#add').click(function(event){
		var tambahkotak = $('#kotak');
		event.preventDefault();	
		$('<input type="text" name="skills[]"><button id="remove">Hapus</button></div>').appendTo(tambahkotak);		
	});
	
	$('body').on('click','#remove',function(){	
		$(this).parent('div').remove();	
	});		
});
</script>
</html>*/