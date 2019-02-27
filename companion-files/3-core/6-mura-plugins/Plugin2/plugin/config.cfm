<cfscript>

	if ( !IsDefined('m') ) {
		siteid = StructKeyExists(session, 'siteid') ? session.siteid : 'default';
		m = application.serviceFactory.getBean('m').init(siteid);
	}

	if ( !IsDefined('pluginConfig') ) {
		pluginConfig = m.getBean('pluginManager').getConfig('Plugin2');
	}

</cfscript>