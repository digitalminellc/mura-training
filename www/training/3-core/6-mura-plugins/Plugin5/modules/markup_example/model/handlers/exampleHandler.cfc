component accessors=true extends='mura.cfobject' output=false {

	public any function init() {
		return this;
	}

	// You could place any other event handlers/listeners here
	public any function onRenderStart(required struct m) {
		// example of accessing the `pluginConfig` from within a module
		// var pluginConfig = arguments.m.getBean('pluginManager').getConfig('Plugin5');
	}

}

