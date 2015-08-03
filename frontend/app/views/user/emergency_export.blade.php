<?php
/*
|
| This is part of a bloody hack for
| https://github.com/JamborJan/paperwork/issues/13
|
| We show an export option in when we detect that an update is due
| from the Paperwork Sandstorm package V3 to V5 (V4 never existed).
| The user then has to export the data and import it again in an empty
| instance.
|
| This hack also requires this change in the not git monitored file
| /opt/app/frontend/vendor/laravel/framework/src/Illuminate/Database/Migrations/Migrator.php
| https://gist.github.com/JamborJan/767f1dc8bede9f97dd53#file-migrator-php-L108
|
*/
?>

@extends("layouts/user-layout")
@section("content")

<ul class="nav nav-tabs nav-tabs-margin" role="tablist">
	<li class="active"><a href="#import" role="tab" data-toggle="tab">[[ Lang::get('messages.user.settings.import_slash_export') ]]</a></li>
</ul>

<p>
Due to migration issues you cannot migrate your data automatically. You can export it here and import it in a new Paperwork grain.
</p>

<div class="tab-content">
	<div class="tab-pane fade in active" id="import">
		@include('user/settings/import', array())
	</div>
</div>
@stop
