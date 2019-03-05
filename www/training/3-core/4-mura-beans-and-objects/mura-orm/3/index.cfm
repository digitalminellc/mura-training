<cfinclude template="../inc/header.cfm" />
	<cftry>

		<!--- New School --->
		<cfscript>
			// A Person
				person = 
					m.getBean('person')
						//.loadBy('namelast', 'Levine')
						.set('namelast', 'Levine')
						.set('namefirst', 'Matt');

				WriteDump(person.getAllValues());

				person.save();

			rsPersons = m.getFeed('person').getQuery();
			WriteDump(rsPersons);
		</cfscript>

		<cfcatch>
			<cfdump var="#cfcatch#"/>
		</cfcatch>
	</cftry>
<cfinclude template="../inc/footer.cfm" />