<cfinclude template="../inc/header.cfm" />
	<cftry>

		<!--- New School --->
		<cfscript>
			// A Person
				person = 
					m.getBean('person')
						.set('namelast', 'Withington')
						.set('namefirst', 'Stephen')
						.save();
		</cfscript>

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