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

<div class="container-narrow" ng-controller="SettingsController">
	<h1>Export your data</h1>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="import">

			<p>
			Due to database migration issues you cannot update old instances automatically. You can export all your data here and import it in a new Paperwork grain. For more details see <a href"https://github.com/JamborJan/paperwork/issues/13" target="_blank">https://github.com/JamborJan/paperwork/issues/13</a>
			</p>

			<p>
				Please follow these steps to update your data:
				<ul>
					<li>Click the export button below</li>
					<li>Save the ENEX file on your local hard drive</li>
					<li>Close this grain</li>
					<li>Install the latest version of the app via Sandstorm app store when not already done</li>
					<li>Create a new grain with the new version of the app</li>
					<li>In Paperwork go to Settings - Import/Export and import your data again</li>
					<li>Now you have a fresh version of your grain with all your data.</li>
					<li>Do the same with all old grains</li>
				</ul>
			</p>

			<p>
				For your convenience some figures to cross check the fresh imported data in the new grain:
				<ul>
					<li>Amount of notebooks: <?php echo Notebook::all()->count()?></li>
					<li>Amount of tags: <?php echo Tag::all()->count()?> (tags with no notes assigned will not be exported)</li>
					<li>Amount of notes: <?php echo Note::all()->count()?></li>
				</ul>
			</p>

			<p>
					[[ Form::open(array('id' => 'form-export', 'class' => 'form', 'role' => 'form', 'action' => 'UserController@export'))]]
					    <div class="form-group">
					        <label class="control-label">
					            [[ Lang::get('messages.user.settings.export.evernotexml') ]]
					        </label>
					        <p class="help-block">[[ Lang::get('messages.user.settings.export.download_evernotexml') ]]</p>
					        <div class="col-sm-offset-5 col-sm-7">
					            [[ Form::submit(Lang::get('keywords.export'), array('id' => 'submit-export', 'class' => 'btn btn-primary')) ]]
					        </div>
					    </div>
					[[ Form::close() ]]
			</p>
		</div>
	</div>
</div>
@stop
