<cfoutput>
	<plugin>
		<name>Plugin4</name>
		<package>Plugin4</package>
		<directoryFormat>packageOnly</directoryFormat>
		<loadPriority>5</loadPriority>
		<version>4.0.0</version>
		<provider>Blue River Interactive</provider>
		<providerURL>http://blueriver.com</providerURL>
		<category>Application</category>
		<settings></settings>

		<eventHandlers>

			<!-- This is the only eventHandler you need to register -->
			<eventHandler 	event="onApplicationLoad"
							component="model.handlers.eventHandler" />

		</eventHandlers>

		<extensions></extensions>
	</plugin>
</cfoutput>