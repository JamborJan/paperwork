@extends("layouts/user-layout")
@section("content")

<p>
This a debug view for the Sandstorm package. You can call it with:
<pre>return View::make('user/sandstorm');</pre>
</p>
<p>
Sandstorm permissions: <?php echo $_SERVER[ 'HTTP_X_SANDSTORM_PERMISSIONS']; ?><br/>
Are you admin? <?php if ($_SERVER[ 'HTTP_X_SANDSTORM_PERMISSIONS'] == "admin,write,read") echo "yes you are!"; ?><br/>
Amount of users: <?php echo User::all()->count()?><br/>
Amount of notebooks: <?php echo Notebook::all()->count()?><br/>
Amount of tags: <?php echo Tag::all()->count()?><br/>
Amount of notes: <?php echo Note::all()->count()?><br/>
</p>
@stop
