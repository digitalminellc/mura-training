# Customizing Mura Output Lab Exercise

1. Create a custom 404 page
2. Create a custom error template
    1. Set `debuggingenabled=false` in the `{context}/config/settings.ini.cfm` file
    2. Intentionally create an error (for example, `<cfoutput>#x#</cfoutput>` or `[m]x[/m]`)
    4. Assign the new error template (hint: the same file used at the beginning of this exercise)
    5. Reload Mura
    6. Preview the new error screen and fix the error!
    7. Set `debuggingenabled=true` and reload so we can see future errors ;)
6. Create a custom `editor.css` file
7. Create a custom image size and use it in a section of your site
