component 
	extends="mura.bean.beanORM" 
	table="custom_persons" 
	entityname="person" 
	bundleable="true" 
	displayname="PersonBean" 
	public=true 
	orderby="namelast,namefirst" {

	// primary key
		property name="personid" fieldtype="id";

	// person attributes
		property name="namefirst" datatype="varchar" length="255" nullable=true;
		property name="namelast" datatype="varchar" length="255" nullable=true;

	// relationships
		property 
			name="phonenumbers" 
			singularname="phonenumber" 
			cfc="personphonenumber" 
			fieldtype="one-to-many" 
			loadkey="personid" 
			cascade="delete"
			orderby="phonetype";
}