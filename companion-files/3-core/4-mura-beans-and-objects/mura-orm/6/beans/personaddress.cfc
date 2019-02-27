component 
	extends="mura.bean.beanORM" 
	table="custom_personaddresses" 
	entityname="personaddress" 
	bundleable="true" 
	displayname="PersonAddressBean" 
	public=true {

	// primary key
		property name="addressid" fieldtype="id";

	// foreign key
		property name="person" fieldtype="many-to-one" cfc="person" fkcolumn="personid" nullable=true;

	// attributes
		property name="addresstype" datatype="varchar" length="255" nullable=true; // Home, Office, etc.
		property name="street1" datatype="varchar" length="255" nullable=true;
		property name="street2" datatype="varchar" length="255" nullable=true;
		property name="city" datatype="varchar" length="255" nullable=true;
		property name="state" datatype="varchar" length="255" nullable=true;
		property name="zip" datatype="varchar" length="255" nullable=true;
}