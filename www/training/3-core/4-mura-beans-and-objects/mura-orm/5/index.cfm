<cfinclude template="../inc/header.cfm" />
	<cftry>

		<!--- New School --->
		<cfscript>
			// Mura Scope
				m = application.mura.getBean('m').init(session.siteid);

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


			// Home Address
				address = 
					m.getBean('personaddress')
						.set(
							{
								'addresstype'='Home'
								, 'street1'='2222 22nd Street'
								, 'city'='Sacramento'
								, 'state'='CA'
								, 'zip'='95816'
							}
						);

				person.addAddress(address);


			// Office Address
				address = 
					m.getBean('personaddress')
						.set(
							{
								'addresstype'='Office'
								, 'street1'='2110 K Street'
								, 'city'='Sacramento'
								, 'state'='CA'
								, 'zip'='95816'
							}
						);

				person.addAddress(address);

			// Save our related entities ...
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

			// addresses
				itAddresses = thisPerson.getAddresses();
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