# Creating Layout Templates Lab Exercise

1. Unzip `html5up-zerofour-raw.zip`
2. Move the theme to the "themes" directory
3. Create a `templates` directory (& move your layout templates inside of it)
4. Rename `.html` files to `.cfm`
5. Create a `default.cfm` layout template
6. Use commonly used layout template names
7. Replace hashtags (`#`) with double-hashtags (`##`)
8. Wrap app output with `<cfoutput></cfoutput>` tags
9. Replace static text and output with template variables and helper methods
  * Use `esapiEncode()` where appropriate
  * Use `m.setDynamicContent()` for output that may contain Mura [m] tags
  * Use `m.dspPrimaryNav()` for the main navigation
  * Use `m.dspBody()` for the main content area
  * Use `m.dspObjects(columnID)` to output objects assigned to display regions
  * Use `m.dspObject(object, objectid)` to display any forms, components, etc. that are intended to be a part of the layout template
  * Use `m.dspCrumbListLinks()` to display breadcrumb links
  * Use `m.createCssHook()` to create css-friendly hooks
  * Use `m.getURLForImage()` for any images
  * Use `m.content(property)` to output any user-entered text for specific fields (other than the body)
  * If creating any component layout templates, don't forget about `m.component(property)`
  * Use `m.siteConfig(property)` for site-level configuration settings (e.g., `m.siteConfig('site')` for the Site Name)
10. Optionally use Mura's CSS `#m.outputMuraCSS(version='7.1', includeskin=true)#`
11. You may deploy `bundle-zerofour-finished.zip` to see an example of a _semi-finished_ integration for comparison purposes
