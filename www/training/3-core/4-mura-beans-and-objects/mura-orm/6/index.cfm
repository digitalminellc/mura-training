<cfinclude template="../inc/header.cfm" />
	<cftry>

		<!--- New School --->
		<cfscript>
			// Mura Scope
				m = application.mura.getBean('m').init(session.siteid);

			// A Person
				person = 
					m.getBean('person')
						.loadby(namelast = 'Withington')
						.set('namelast', 'Withington')
						.set('namefirst', 'Steve');

				person.save();

				// Home Phone
					phoneNumber = 
						m.getBean('personphonenumber')
							.loadBy(phonetype = 'Home')
							.set('phonetype', 'Home')
							.set('phonenumber', '916.444.4444');
					
					person.addPhoneNumber(phoneNumber);

				// Mobile Phone
					phoneNumber = 
						m.getBean('personphonenumber')
							.loadBy(phonetype = 'Mobile')
							.set('phonetype', 'Mobile')
							.set('phonenumber', '916.555.5555');

					person.addPhoneNumber(phoneNumber);

				// Home Address
					address = 
						m.getBean('personaddress')
							.loadBy(addresstype = 'Home')
							.set(
								{
									'addresstype'='Home'
									, 'street1'='111 Home Street'
									, 'city'='Sacramento'
									, 'state'='CA'
									, 'zip'='95816'
								}
							);

					person.addAddress(address);

				// Office Address
					address =
						m.getBean('personaddress')
							.loadBy(addresstype = 'Office')
							.set(
								{
									'addresstype'='Office'
									, 'street1'='222 Office Street'
									, 'city'='Sacramento'
									, 'state'='CA'
									, 'zip'='95816'
								}
							);

					person.addAddress(address);

			// SAVE!
				person.save();

	// Feed
		personFeed = 
			m.getFeed('person')
				.setMaxItems(0)
				.setNextN(0); 

	// Iterator
		itPersons = personFeed.getIterator();

		if ( !itPersons.hasNext() ) {
			WriteOutput('<div class="alert alert-info">No persons exist</div>');
		}

		while(itPersons.hasNext()) {
			thisPerson = itPersons.next();

			WriteOutput(
				'<div class="alert alert-success"><h2>' 
				& thisPerson.get('namefirst') 
				& ' ' 
				& thisPerson.get('namelast') 
				& '</h2>'
			);

			// addresses
				itAddresses = thisPerson.getAddresses();

				if ( itAddresses.hasNext() ) {
					addressTitle = itAddresses.getRecordcount() == 1 ? 'Address' : 'Addresses';
					WriteOutput('<h3>#addressTitle#</h3><ul>');
					while(itAddresses.hasNext()) {
						address = itAddresses.next();
						WriteOutput('<li>');
							WriteOutput(
								'<strong>' 
								& address.get('addresstype') 
								& ':</strong> ' 
								& address.get('street1') 
								& ', ' 
								& address.get('city') 
								& ', ' 
								& address.get('state') 
								& ' ' 
								& address.get('zip')
							);
						WriteOutput('</li>');
					}
					WriteOutput('</ul>');
				}

			// phonenumbers
				itPhoneNumbers = thisPerson.getPhoneNumbers();

				if ( itPhoneNumbers.hasNext() ) {
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

				WriteOutput('</div>');

			}
		</cfscript>

		<cfcatch>
			<cfdump var="#cfcatch#"/>
		</cfcatch>
	</cftry>
<cfinclude template="../inc/footer.cfm" />