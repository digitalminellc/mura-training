<cfinclude template="plugin/config.cfm" />

<cfsavecontent variable="pluginBody">
	<cfoutput>
		<h1>#esapiEncode('html', pluginConfig.getName())#</h1>
		<p>This is my first Mura plugin.</p>
	</cfoutput>
</cfsavecontent>

<cfoutput>
	#m.getBean('pluginManager').renderAdminTemplate(
		body = pluginBody
		, pageTitle = pluginConfig.getName()
	)#
</cfoutput>