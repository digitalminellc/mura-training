<cfparam name="objectParams.helloworldtext" default="">
<cf_objectconfigurator>
    <cfoutput>
        <div class="mura-control-group">
            <label class="mura-control-label">Hello World Text</label>
            <input  type="text"
                    name="helloworldtext"
                    class="objectParam"
                    value="#esapiEncode('html_attr', objectParams.helloworldtext)#">
        </div>
    </cfoutput>
</cf_objectconfigurator>
