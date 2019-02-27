<cfinclude template="inc/header.cfm" />

	<cfif url.drop>
		<cftry>
			<cfquery datasource="#dsn#">
				DROP TABLE IF EXISTS `custom_persons`;
			</cfquery>
			<cfquery datasource="#dsn#">
				DROP TABLE IF EXISTS `custom_personaddresses`;
			</cfquery>
			<cfquery datasource="#dsn#">
				DROP TABLE IF EXISTS `custom_personphonenumbers`;
			</cfquery>
			<div class="alert alert-success">
				<h3>Cool!</h3> 
				<p><code>custom_persons</code>, <code>custom_personaddresses</code>, and <code>custom_personphonenumbers</code> tables have been dropped!</p>
			</div>
			<cfcatch>
				<cfdump label="drop tables error" var="#cfcatch#" />
			</cfcatch>
		</cftry>
	</cfif>

	<cfif url.seepersons>
		<cftry>
			<cfquery name="rspersons" datasource="#dsn#">
				SELECT * FROM `custom_persons`;
			</cfquery>
			<cfdump label="rspersons" var="#rspersons#" />
			<cfcatch>
				<cfdump label="rspersons error" var="#cfcatch#" />
			</cfcatch>
		</cftry>
	</cfif>

	<cfif url.seeaddresses>
		<cftry>
			<cfquery name="rsaddresses" datasource="#dsn#">
				SELECT * FROM `custom_personaddresses`;
			</cfquery>
			<cfdump label="rsaddresses" var="#rsaddresses#" />
			<cfcatch>
				<cfdump label="rsaddresses error" var="#cfcatch#" />
			</cfcatch>
		</cftry>
	</cfif>

	<cfif url.seephones>
		<cftry>
			<cfquery name="rsphones" datasource="#dsn#">
				SELECT * FROM `custom_personphonenumbers`;
			</cfquery>
			<cfdump label="rsphones" var="#rsphones#" />
			<cfcatch>
				<cfdump label="rsphones error" var="#cfcatch#" />
			</cfcatch>
		</cftry>
	</cfif>

<cfinclude template="inc/footer.cfm" />