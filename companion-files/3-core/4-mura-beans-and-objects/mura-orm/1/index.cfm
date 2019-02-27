<cfinclude template="../inc/header.cfm" />
	<cftry>
		<!--- Old School --->
		<cfquery name="rsNew">
			INSERT INTO custom_persons (
				namelast
				, namefirst
				, personid
			) VALUES (
				'Shepert'
				, 'Grant'
				, <cfqueryparam value="#CreateUUID()#" />
			);
		</cfquery>

		<!--- Old School --->
		<cfquery name="rsPersons">
			select * from custom_persons;
		</cfquery>

		<cfdump var="#rsPersons#" />

		<cfcatch>
			<cfdump var="#cfcatch#"/>
		</cfcatch>
	</cftry>
<cfinclude template="../inc/footer.cfm" />