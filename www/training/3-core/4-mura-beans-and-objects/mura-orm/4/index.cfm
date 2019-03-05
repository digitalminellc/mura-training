<cfinclude template="../inc/header.cfm" />
	<cftry>

		<!--- New School --->
		<cfscript>
			// A Person
				person = 
					m.getBean('person')
						.loadby(namelast='Withington')
						.set('namelast', 'Withington')
						.set('namefirst', 'Steve')
						.save();


			// Home Phone
				phoneNumber = 
					m.getBean('personphonenumber')
						.set('phonetype', 'Home')
						.set('phonenumber', '916.555.1212');

				person.addPhoneNumber(phoneNumber);

			// Mobile Phone
				phoneNumber = 
					m.getBean('personphonenumber')
						.set('phonetype', 'Mobile')
						.set('phonenumber', '916.555.1010');

				person.addPhoneNumber(phoneNumber);

			// This will save the related entities we've added ...
				person.save();

			// Feed
				personFeed = m.getFeed('person').setMaxItems(0).setNextN(0); 

			// Iterator
				itPersons = personFeed.getIterator();

				if ( !itPersons.hasNext() ) {
					WriteOutput('<div class="alert alert-info">No persons exist</div>');
				}

				while(itPersons.hasNext()) {
					thisPerson = itPersons.next();

					WriteOutput('<h2>' & thisPerson.get('namefirst') & ' ' & thisPerson.get('namelast') & '</h2>');

					// phonenumbers
						itPhoneNumbers = thisPerson.getPhoneNumbers();
						phoneNumberTitle = itPhoneNumbers.getRecordcount() == 1 ? 'Phone Number' : 'Phone Numbers';
						WriteOutput('<h3>#phoneNumberTitle#</h3><ul>');
						while(itPhoneNumbers.hasNext()) {
							phoneNumber = itPhoneNumbers.next();
							WriteOutput('<li>');
								WriteOutput(
									'<strong>' 
									& phoneNumber.get('phonetype') 
									& ':</strong> ' 
									& phoneNumber.get('phonenumber')
								);
							WriteOutput('</li>');
						}
						WriteOutput('</ul>');

					}
		</cfscript>

		<cfcatch>
			<cfdump var="#cfcatch#"/>
		</cfcatch>
	</cftry>
<cfinclude template="../inc/footer.cfm" />