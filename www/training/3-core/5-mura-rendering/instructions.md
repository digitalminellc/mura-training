# Mura Rendering Lab Exercise

* Review Mura's contentRenderer.cfc
* Override a Mura contentRenderer method
* Modify `this.{settings}`
* Disable Mura Tags globally
* Enable Mura Tags at the site level
* Allow for Mura Tags to be used in the Title field of content
* Display Objects
  * Create an uber simple display object, no configurator
  * Create a simple display object, with a configurator
  * Refer to `1-murahelloworld-cfml` example
  * Create a display object, with a `model` directory and a `handlers` directory (include a custom handler)
  * Create a display object with `beans`
  * Refer to `2-muracontacts-cfml` example
* Using the Page/Location & Folder/Locations class extensions, create a custom display
using `content_types/{Type}_{Subtype}`
* Mura.js
  * Use Mura.js to modify an element of your theme's layout template
  * Review `3-murahelloworld-js/scripts.js` ... go over `Mura.Module.{moduleName}`
  * Review `4-muracontacts-js`
* Internationalization
  * Create a custom resource bundle key, and output it
* Caching
  * Using custom stack trace points and caching strategies, attempt to optimize the output of your layout templates
