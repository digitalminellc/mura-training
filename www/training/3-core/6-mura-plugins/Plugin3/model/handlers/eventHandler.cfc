component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	public any function onApplicationLoad(required struct m) {
		// Register all event handlers/listeners of this .cfc with Mura CMS
		variables.pluginConfig.addEventHandler(this);
	}

	public any function onPageDefaultBodyRender(required struct m) {
		// Dynamically alter the 'Title' of the page
		m.content('title', 'Hijacked by Plugin3!');
		// Override the output of the main body area of Page / Default
		return '<h3>#m.content('title')#</h3>' & m.content('body');
	}

	// Add any event handlers here

}

