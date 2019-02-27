<cfscript>
	siteid = StructKeyExists(session, 'siteid') ? session.siteid : 'default';
	m = application.mura.getBean('m').init(siteid);
	dsn = m.globalConfig('datasource');
	pathtohere = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot')));
	modeldir = Left(pathtohere, Len(pathtohere) - 4) & 'model';
	m.globalConfig().registerModelDir(modeldir);

	param name="url.drop" default="0";
	param name="url.seepersons" default="0";
	param name="url.seeaddresses" default="0";
	param name="url.seephones" default="0";
</cfscript>
<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<title>Mura ORM</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<style>
	* {
		-webkit-border-radius: 0 !important;
		-moz-border-radius: 0 !important;
		border-radius: 0 !important;
	}
	body {
		min-height: 2000px;
		padding-top: 70px;
	}
	/* custom lucee dump styling */
	.-lucee-dump table, .-lucee-dump table td.h1, .-lucee-dump table td.h3 {
		font-size: 10px !important;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##main-nav" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#m.globalConfig('context')#/mura-orm/">Mura ORM</a>
			</div>

			<div class="collapse navbar-collapse" id="main-nav">
				<ul class="nav navbar-nav">
					<li><a href="#m.globalConfig('context')#/mura-orm/?appreload&amp;applydbupdates">Reload&amp;ApplyDBUpdates</a></li>
					<li><a href="#m.globalConfig('context')#/mura-orm/?drop=1">Drop Tables</a></li>
					<li><a href="#m.globalConfig('context')#/mura-orm/?seepersons=1">View Persons</a></li>
					<li><a href="#m.globalConfig('context')#/mura-orm/?seeaddresses=1">View Addresses</a></li>
					<li><a href="#m.globalConfig('context')#/mura-orm/?seephones=1">View Phones</a></li>
					<li class="dropdown">
							<a href="##" class="dropdown-toggle" role="button" data-toggle="dropdown">Demos/Labs</a>
							<ul class="dropdown-menu">
								<li><a href="#m.globalConfig('context')#/mura-orm/1/">1</a></li>
								<li><a href="#m.globalConfig('context')#/mura-orm/2/">2</a></li>
								<li><a href="#m.globalConfig('context')#/mura-orm/3/">3</a></li>
								<li><a href="#m.globalConfig('context')#/mura-orm/4/">4</a></li>
								<li><a href="#m.globalConfig('context')#/mura-orm/5/">5</a></li>
								<li><a href="#m.globalConfig('context')#/mura-orm/6/">6</a></li>
							</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
</cfoutput>