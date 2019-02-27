<cfset local.modulepath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot'))) />
<cfparam name="objectparams.helloworldtext" default="">

<cfoutput>
  <div class="alert alert-info">
    <h3><i class="fa fa-phone"></i> Hello World <small>(CFML)</small></h3>
    #esapiEncode('html', objectparams.helloworldtext)#
  </div>


<!--
<script>
  // If you wish to add CSS or JS ...
  Mura(function(m) {
    m.loader()
      .loadcss('#local.modulepath#assets/css/my.css') 
      .loadjs(
        '#local.modulepath#assets/js/my.js',
        '#local.modulepath#assets/js/other.js',
        function() {
          // Do something with the loaded JS
        }
      );
  });
</script>
-->
</cfoutput>