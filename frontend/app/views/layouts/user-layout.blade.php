<!DOCTYPE html>
<html lang="en">
  <head>
    @include('partials/header-sidewide-meta')

	<!-- [[ HTML::style('css/bootstrap.min.css') ]] -->
    <!-- [[ HTML::style('css/bootstrap-theme.min.css') ]] -->

    [[ HTML::style('css/themes/paperwork-v1.min.css') ]]

    [[ HTML::style('css/freqselector.min.css') ]]

    [[ HTML::style('css/typeahead.min.css') ]]
    
	<!-- 
	See https://github.com/twostairs/paperwork/issues/135 
    [[ HTML::style('css/mathquill.css')]]
	-->

    [[ HTML::style('css/bootstrap-editable.css') ]]
   
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

				@if ((array_key_exists('HTTP_X_SANDSTORM_PERMISSIONS', $_SERVER) ? $_SERVER[ 'HTTP_X_SANDSTORM_PERMISSIONS'] : '') == 'admin')
					@include('partials/menu-main')
				@endif

				@include('partials/search-main')
				
				<!-- We don't need these buttons in Sandstorm Mode-->
				@if (!array_key_exists('HTTP_X_SANDSTORM_PERMISSIONS', $_SERVER))
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

	[[ HTML::script('js/jquery.min.js') ]]
	[[ HTML::script('js/libraries.min.js') ]]
	[[ HTML::script('js/angular.min.js') ]]

	[[ HTML::script('js/paperwork.min.js') ]]
	[[ HTML::script('js/paperwork-native.min.js') ]]

	[[ HTML::script('js/bootstrap.min.js') ]]
	[[ HTML::script('js/tagsinput.min.js') ]]

	[[ HTML::script('ckeditor/ckeditor.js') ]]
	[[ HTML::script('ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js') ]]
	[[ HTML::script('js/bootstrap-editable.min.js') ]]

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    [[ HTML::script('js/ltie9compat.min.js') ]]
  <![endif]-->
  <!--[if lt IE 11]>
    [[ HTML::script('js/ltie11compat.js') ]]
  <![endif]-->

</body>
</html>
