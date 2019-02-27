<cfsilent>
	<cfparam name="objectParams.exampletext" default="">
    <cfparam name="objectParams.exampletextarea" default="">
    <cfparam name="objectParams.exampleselect" default="">
    <cfparam name="objectParams.exampleradio" default="false">
    <cfparam name="objectParams.examplecheckbox" default="">
</cfsilent>
<cf_objectconfigurator>
    <cfoutput>
        <!--- Example Text Field --->
        <div class="mura-control-group">
            <label class="mura-control-label">Example Text</label>
            <input type="text" name="exampletext" class="objectParam" value="#esapiEncode('html_attr',objectParams.exampletext)#"/>
        </div>

        <!--- Example TextArea Field --->
        <div class="mura-control-group">
            <label class="mura-control-label">Example Text Area</label>
            <textarea name="exampletextarea" class="objectParam">#objectParams.exampletextarea#</textarea>
        </div>

        <!--- Example Select --->
        <div class="mura-control-group">
            <label>Example Select</label>
            <select class="objectParam" name="exampleselect">
                <option value="">Example Select</option>
                <cfloop list="1,2,3" item="i">
                <option <cfif objectParams.exampleselect eq i>selected </cfif>value="#i#">#i#</option>
                </cfloop>
            </select>
        </div>

        <!--- Example Radio Group --->
        <div class="mura-control-group">
    		<label class="mura-control-label">
    		      Example Radio Group
    		</label>

    		<label><input type="radio" class="objectParam" name="exampleradio" value="true" <cfif objectParams.exampleradio> checked</cfif>/> Yes</label>
    		<label><input type="radio" class="objectParam" name="exampleradio"value="false "<cfif not objectParams.exampleradio> checked</cfif>/> No</label>

        </div>

        <!--- Example Checkboxes	--->
        <div class="mura-control-group">
			<cfloop list="option1,option2" item="i">
			<label class="mura-control-label">
    		    <input type="checkbox" class="objectParam" name="examplecheckbox" value="#i#"<cfif listFind(objectParams.examplecheckbox,i)> checked</cfif>>
                #i#
          	</label>
			</cfloop>
        </div>
    </cfoutput>

    <!---
        Include global meta data object options, This can be overridden just like another display object file.
        Attributes here are output in the meta labeling include object/meta.cfm.
        This be seen when labeling a Form or Component display object.

		This basically provides a standardized way of labeling everything.
    --->
    <cfinclude template="#m.siteConfig().lookupDisplayObjectFilePath('object/configurator.cfm')#">

    <!--- The <objectconfigurator/> tag itself provides the Alignment, Offset, Width and CssClass attributes --->
</cf_objectconfigurator>
