<h1>Login</h1>
@if($errors->any())
<h4>{{$errors->first()}}</h4>
@endif
<form method="post" action="/postlogin">
@csrf
email<br>
<input type="text" name="email"><br>
password<br>
<input type="text" name="password"><br>
<input type="submit" value="Login">
</form>