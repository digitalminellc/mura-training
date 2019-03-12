# Mura Events Lab Exercise

## Let's add and replace some business logic

* Dump `m.event()`
* Dump `m.event().getAllValues()`
* Write an `onApplicationLoad` method to set an application variable
* Override a Standard Event
* Write an Admin Area Rendering event (e.g., `onAdminHTMLFootRender`)
* Write a Content Editing event (e.g., `onBeforeContentSave`, and/or `onBefore{Type}Save`)
* Write a Content Rendering event (e.g., `onDisplayRender` or `on{Type}{Subtype}BodyRender`)
* Write a User Editing event (e.g., `onBeforeUserSave` and/or `onAfterGroupSave`)
* Write a Login Related Event (e.g., `onContentDenialRender`)
* Register an event handler by convention
* Trigger a method in both the "Site" and "Theme" event handler (double output)
* Dump `m.event('__MuraResponse__')`
* Explicitly register an event handler
* Create a custom event
* Announce a custom event
* Render a custom event
* Add a custom Stack Trace point
