<cfoutput>
	<plugin>
		<name>Plugin1</name>
		<package>Plugin1</package>
		<directoryFormat>packageOnly</directoryFormat>
		<loadPriority>5</loadPriority>
		<version>1.0.0</version>
		<provider>Blue River Interactive</provider>
		<providerURL>http://blueriver.com</providerURL>
		<category>Application</category>
		<settings>

			<!--- Example Setting --->
			<!--- <setting>
				<name>yourSettingName</name>
				<label>Your Label</label>
				<hint>Your Hint</hint>
				<type>text|radioGroup|textArea|select|multiSelectBox</type>
				<required>false|true</required>
				<validation>none|email|date|numeric|regex</validation>
				<regex>Your JavaScript regex (if validation=regex)</regex>
				<message>Your message if validation fails</message>
				<defaultvalue>1</defaultvalue>
				<optionlist>1^2^3</optionlist>
				<optionalabellist>One^Two^Three</optionalabellist>
			</setting> --->
		
		</settings>
		<eventHandlers></eventHandlers>
		<extensions></extensions>
	</plugin>
</cfoutput>

