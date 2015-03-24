<!DOCTYPE html>
<html lang="en">
  <head>
    @include('partials/header-sidewide-meta')

	<link media="all" type="text/css" rel="stylesheet" href="css/themes/paperwork-v1.min.css">
	<link media="all" type="text/css" rel="stylesheet" href="css/freqselector.min.css">
	<link media="all" type="text/css" rel="stylesheet" href="css/typeahead.min.css">
	<link media="all" type="text/css" rel="stylesheet" href="css/mathquill.css">
	<link media="all" type="text/css" rel="stylesheet" href="css/bootstrap-editable.css">
    
</head>
  <body ng-app="paperworkNotes">
  	<div ng-controller="ConstructorController"></div>

	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">[[Lang::get('keywords.toggle_navigation')]]</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="paperwork-logo navbar-brand transition-effect" href="[[ URL::route("/") ]]"><img src="/images/navbar-logo.png"> Paperwork</a>
			</div>
			<div class="navbar-collapse collapse">
				<div class="visible-xs">
					<form class="navbar-form" role="form">
				  		<div class="form-group" ng-controller="SidebarNotebooksController">
				  			<select class="form-control navbar-search">
							  <option ng-repeat="notebook in notebooks" data-notebookid="{{ notebook.children.length > 0 ? '' : notebook.id }}">{{notebook.title}}</option>
							</select>
						</div>
				  		<div class="form-group" ng-controller="SidebarNotesController">
				  			<select class="form-control navbar-search">
							  <option ng-repeat="note in notes">{{note.title}}</option>
							</select>
						</div>
					</form>
				</div>

				@include('partials/menu-main')

				@include('partials/search-main')
				
				<!-- We don't need these buttons in Sandstorm Mode-->
				@if (!array_key_exists('HTTP_X_SANDSTORM_USER_ID', $_SERVER))
					@include('partials/navigation-main')
				@endif

			</div>
		</div>
	</div>

	@yield("content")

    <div class="footer footer-issue [[ Config::get('paperwork.showIssueReportingLink') ? '' : 'hide' ]]">
      <div class="">
        <div class="alert alert-warning" role="alert">
          <p>[[Lang::get('messages.found_bug')]]</p>
        </div>
      </div>
    </div>

	<script src="js/jquery.min.js"></script>
	<script src="js/libraries.min.js"></script>
	<script src="js/angular.min.js"></script>

	<script src="js/paperwork.min.js"></script>
	<script src="js/paperwork-native.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
	<script src="js/tagsinput.min.js"></script>
	
	<script src="ckeditor/ckeditor.js"></script>
	<script src="ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
	<script src="js/bootstrap-editable.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="js/ltie9compat.min.js"></script>
	<![endif]-->
	<!--[if lt IE 11]>
		<script src="js/ltie11compat.js"></script>
	<![endif]-->

</body>
</html>
