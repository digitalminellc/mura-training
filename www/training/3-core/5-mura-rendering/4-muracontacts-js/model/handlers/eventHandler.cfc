component output="false" extends="mura.cfobject" {
  // Place any custom event handler methods in here and they will automatically be registered
  // Be sure to reload the application after you make any changes
  function onApplicationLoad(m) {
    // dynamic paths ...
    set('modulehandlerpath', RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(arguments.m.globalConfig('webroot'))));
    var moduleroot = get('modulehandlerpath');
    set('modulesindex', ListContains(moduleroot, 'modules', '/'));
    set('moduleindex', get('modulesIndex') + 1);
    set('moduledir', ListGetAt(moduleroot, get('moduleindex'), '/'));

    While(ListLen(moduleroot, '/') > get('moduleindex')) {
      moduleroot = ListDeleteAt(moduleroot, get('moduleindex') + 1, '/');
    }

    set('moduleroot', moduleroot);
  }

  function onRenderStart(m){
    m.addToHTMLHeadQueue('<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.0/handlebars.min.js"></script><script src="#get('moduleroot')#/assets/dist/js/muracontacts.min.js"></script>');
  }
}
