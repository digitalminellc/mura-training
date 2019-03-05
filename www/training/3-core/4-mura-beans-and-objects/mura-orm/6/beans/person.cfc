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
			cascade='delete' 
			orderby="phonetype";

		property 
			name="addresses" 
			singularname="address" 
			cfc="personaddress" 
			fieldtype="one-to-many" 
			loadkey="personid" 
			cascade='delete' 
			orderby="addresstype";

	// foreign key (pre-defined bean by Mura)
		property name="site" cfc="site" fieldtype="many-to-one" fkcolumn="siteid";

	// hidden
		property name="datecreated" datatype="datetime" nullable=true;
		property name="datemodified" datatype="datetime" nullable=true;

	// Custom Methods
		public any function save() {
			set('datemodified', Now());

			if ( !Len(get('datecreated')) ) {
				set('datecreated', Now());
			}

			super.save(argumentcollection=arguments);
		} 
	// @end Custom Methods

}