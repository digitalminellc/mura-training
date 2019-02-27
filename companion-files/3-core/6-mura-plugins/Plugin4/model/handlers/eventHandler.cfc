component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	public any function onApplicationLoad(required struct m) {
		// Register all event handlers/listeners of this .cfc with Mura CMS
		variables.pluginConfig.addEventHandler(this);
	}

	// Add any event handlers here

}