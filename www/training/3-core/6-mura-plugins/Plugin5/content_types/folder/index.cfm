<cfscript>
	objectparams.sourcetype = 'children';
	objectparams.source = m.content('contentid');
</cfscript>
<cfoutput>
	<h3>Hello from Plugin5</h3>

	#m.dspObject_include(
		thefile="collection/index.cfm"
		, params=objectParams
	)#
</cfoutput>