component 
	extends="mura.bean.beanORM" 
	table="custom_personphonenumbers" 
	entityname="personphonenumber" 
	bundleable="true" 
	displayname="PersonPhoneNumberBean" 
	public=true {

	// primary key
		property name="phonenumberid" fieldtype="id";

	// foreign key
		property name="person" fieldtype="many-to-one" cfc="person" fkcolumn="personid" nullable=true;

	// attributes
		property name="phonetype" datatype="varchar" length="255" nullable=true; // Home, Office, Mobile, etc.
		property name="phonenumber" datatype="varchar" length="255" nullable=true;
}