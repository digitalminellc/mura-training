# muracontacts

## Please Note

This is intended for [Mura](http://www.getmura.com) (v7.1+) training purposes only. It should **not** to be used for production purposes.

This is the [JS branch of the muracontacts project](https://github.com/stevewithington/muracontacts/tree/js). It is intended to be an example of how a JavaScript developer might approach creating a simple, framework-agnostic application as a self-contained Mura Module.


## Instructions

Each branch of [this project](https://github.com/stevewithington/muracontacts) is intended to be an example of how to use Mura ORM with a custom module.

Switch to the desired branch, download it, and place entire directory under a `modules` directory. For example:
`{context}/modules/muracontacts`

Assuming you're using the default Mura application reload key, you should be able to add `?appreload&applydbupdates` to the URL to force Mura to reload and parse the ORM objects into database objects.

A new module option should appear in the list of available modules when using **Inline Edit** mode. Simply drag it onto the layout in the desired display region and publish.


## Modifying Files

If you want to be able to play around with the files, and make changes, please note that this project uses [Grunt](http://gruntjs.com/) for combining and minifying JavaScript, Less, and CSS files. If you haven't used Grunt before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide.

Assuming you have [Node.js](https://nodejs.org) installed, you'll need to run `npm install` from the terminal within the project directory before running Grunt. Once you've done that, you should now be able to run `grunt` from the command line to compile scripts and less/css files. Or, run `grunt watch` to have your files automatically compile every time you save your files.


## License

Copyright 2016-2019 [Stephen J. Withington, Jr.](https://linkedin.com/in/stevewithington/)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

![Built with Handlebars](https://github.com/pixel-cookers/built-with-badges/blob/master/handlebars/handlebars-short-flat.png)
![Built with Grunt](https://github.com/pixel-cookers/built-with-badges/blob/master/grunt/grunt-short-flat.png)
![Built with Bootstrap](https://github.com/pixel-cookers/built-with-badges/blob/master/bootstrap/bootstrap-short-flat.png)
![Styled with Less](https://github.com/pixel-cookers/built-with-badges/blob/master/less/less-short-flat.png)
