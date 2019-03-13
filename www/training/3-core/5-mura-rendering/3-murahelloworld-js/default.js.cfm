<cfscript>
  siteid = StructKeyExists(session, 'siteid') ? session.siteid : 'default';
  m = application.serviceFactory.getBean('m').init(siteid);
  modulepath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot')));
  moduledir = ListLast(modulepath, '/');
</cfscript>
<cfcontent reset="yes" type="text/javascript"><cfoutput>
Mura.preInit(function(m) {

  // Mura.Module.{yourModuleDirectoryName}
  m.Module['#moduledir#'] = m.UI.extend({

    // Mura invokes the 'render()' method by default
    render: function() {

      // objectparams (configurator settings) are available under 'this.context.{yourVar}'
      var helloworldtext =
            this.context.helloworldtext === undefined
              ? 'helloworldtext is not defined yet.'
              : this.context.helloworldtext
          , heading = '<h3><i class="fa fa-phone"></i> Hello World <small>(JS)</small></h3>';

      m(this.context.targetEl).html('<div class="alert alert-success">' + heading + helloworldtext + '</div>');
    }

  });

});
</cfoutput>