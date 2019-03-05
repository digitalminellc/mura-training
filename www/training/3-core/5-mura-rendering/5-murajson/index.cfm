<!---
  Author: Stephen J. Withington, Jr.
  Notes:  Place this under a temp directory within your Mura CMS root to test.
          For example: http://yourdomain.com/temp/json-test.cfm
--->
<cfscript>
  param name="form.endpoint" default="content/new";
  param name="form.method" default="GET";
  param name="form.context" default="";
  param name='session.siteid' default='default';
  param name='url.entityName' default='content';

  if ( StructKeyExists(url, 'siteid') ) {
    session.siteid = url.siteid;
  }

  $ = application.serviceFactory.getBean('$').init(session.siteid);
</cfscript>

<cfoutput>
  <!DOCTYPE html>
  <html>
  <head>
    <script type="text/javascript">if(!window.console)console={log:function(){}};</script>

    <title>Mura JSON API Tests</title>
    <link href="data:image/x-icon;" rel="shortcut icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <style>
      body {
        padding: 1em;
        padding-bottom: 10em;
        font-family: sans-serif;
        background-color: ##e5eaf1;
        color: grey;
      }

      h1,h2,h3,label {
        color: ##4c709d;
      }

      a, a:visited {
        color: black;
        text-decoration: none;
      }

      a:hover, a:focus {
        color: grey;
      }

      .minor {
        font-size: 0.9em;
      }

      ##loading { 
        display: none;
        font-weight: bold;
        color: ##4c709d;
        margin: 0 0 2em 0;
      }

      label {
        clear:both;
        display:block;
        font-size: 0.8em;
        padding: 0.5em 0 0.2em 0;
        width: 100%;
      }

      input[name="endpoint"], label.ep input {
        clear:both;
        display: block;
        width: 100%;
        padding: 0.2em;
        margin-top: 0.2em;
        color: grey;
        border:none;
        font-weight: normal;
      }

      .x {
        font-weight: bold;
        margin: 1em 0 0.5em 0;
        padding-top: 1em;
        border-top: 1px solid grey;
      }

      .x > a {
        margin-bottom:0.5em;
      }

      pre {
        white-space: pre-wrap;
        white-space: -moz-pre-wrap;
        white-space: -pre-wrap;
        white-space: -o-pre-wrap;
        word-wrap: break-word; 
      }
    </style>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
      jQuery(document).ready(function($) {

        var baseNoSiteID = '#$.getBean('utility').getRequestProtocol()#://#cgi.http_host##$.globalConfig('context')#/index.cfm/_api/json/v1/';
        var base = baseNoSiteID + '#session.siteid#/';

        // Ajax Loader
          $(document)
            .ajaxStart(function() {
              $('##loading').fadeIn('fast');
            })
            .ajaxStop(function() {
              $('##loading').hide();
            })
            .ajaxComplete(function() {
              $('.x > a').on('click', function(e){
                e.preventDefault();
                $(this).parent().parent().remove();
              });
            });


        // ***************************** Form Handler ****************************
          $('##frm').submit(function(e) {
            e.preventDefault();
            clearResponse();

            var endpoint = $('input[name="endpoint"]').val();
            var arrayEndpoint = endpoint.split('/');
            var method = $('select[name="method"]').val();

            if ( arrayEndpoint.length > 0 && arrayEndpoint[0] === 'login' ) {
                return login(endpoint);
            }

            return method === 'DELETE'
              ? deleteEntity(endpoint)
              : processRequest(endpoint, {}, method);
          });

        // Test Endpoints
          $('label.ep').click(function(e) {
            e.preventDefault();
            var $this = $(this);
            var endpoint = $this.find('input.endpoint').val()
            $("input[name='endpoint']").val(endpoint);
            $("select[name='method']").val($this.attr('data-method'));
          });

        // start login
          var login = function(endpoint) {
            logData('===== login() ========');

            var reqParams = ['username','password'];
            var params = getQueryParams(endpoint);
            var data = {};

            // validate params
            for ( var i = 0; i < reqParams.length; i++ ) {
              data[reqParams[i]] = typeof params[reqParams[i]] !== 'undefined'
                ? params[reqParams[i]][0]
                : '';
            }

            logData('data to be sent:');
            logData(data);
            
            $.ajax({
              url: base + '?method=generateCSRFTokens&siteid=#session.siteid#&context=login&cacheid=' + Math.random(),
              type: 'GET',
              dataType: 'json',
              cache: false
            })
              .done(function(json) {
                logData('===== CSRFTokens Created ========');
                logData(json.data);

                data['csrf_token'] = json.data.csrf_token;
                data['csrf_token_expires'] = json.data.csrf_token_expires;

                return processRequest(endpoint, data, 'POST');
              })
              .fail(function(xhr, status, errorThrown) {
                logData('==== CSRFToken Creation Failed ====');
                var resp = xhr['responseText'];
                var jResp = JSON.parse(resp);
                displayJSON(jResp);

                logData(jResp);
                logData('status: ' + status);
                logData('errorThrown: ' + errorThrown);
              });
          }

        // start delete
          var deleteEntity = function(endpoint) {
            logData('===== deleteEntity() ========');

            var reqParams = ['siteid','entityName','id','method'];
            var params = getQueryParams(endpoint);
            var data = {};

            // validate params
            for ( var i = 0; i < reqParams.length; i++ ) {
              data[reqParams[i]] = typeof params[reqParams[i]] !== 'undefined'
                ? params[reqParams[i]][0]
                : '';
            }
            logData('data to be sent:');
            logData(data);
            
            $.ajax({
              url: base + '?method=generateCSRFTokens&siteid=#session.siteid#&context=' + data['id'] + '&cacheid=' + Math.random(),
              type: 'GET',
              dataType: 'json',
              cache: false
            })
              .done(function(json) {
                logData('===== CSRFTokens Created ========');
                logData(json.data);
                data['csrf_token'] = json.data.csrf_token;
                data['csrf_token_expires'] = json.data.csrf_token_expires;
                return processRequest(endpoint, data, 'POST');
              })
              .fail(function(xhr, status, errorThrown) {
                logData('==== CSRFToken Creation Failed ====');
                var resp = xhr['responseText'];
                var jResp = JSON.parse(resp);
                displayJSON(jResp);

                logData(jResp);
                logData('status: ' + status);
                logData('errorThrown: ' + errorThrown);
              });
          }

        // processRequest
          var processRequest = function(url, data, type) {
            logData('===== processRequest() ========');

            if ( !$.isEmptyObject(data) ) {
              logData('data argument received:');
              logData(data);
              displayJSON(data);
            }

            $.ajax({
              type: type,
              url: base + url,
              dataType: 'json',
              data: data
            })
              .done(function(json) {
                // success
                logData('==== DONE - Success! ====');
                logData(json);
                displayJSON(json);
              })
              .fail(function(xhr, status, errorThrown) {
                // failed
                logData('==== DONE - Fail! ====');
                logData(xhr['responseText']);
                //var args = Array.prototype.slice.call(arguments);
                var resp = xhr['responseText'];
                var jResp = JSON.parse(resp);
                displayJSON(jResp);

                logData(jResp);
                logData('status: ' + status);
                logData('errorThrown: ' + errorThrown);
              });
          }

        // Helpers ------------------------------------------------------------
          var logData = function(data) {
            console.log(data);
          }

          var displayJSON = function(json) {
            // prettify the json for display
            var jsonStr = JSON.stringify(json, null, '\t');
            $('<div class=\"response\">')
              .html('<div class="x"><a class="btn btn-primary" href="##">Clear</a></div><pre>'+escapeHtml(jsonStr)+'</pre>')
              .appendTo('##result');
          }

          var clearResponse = function() {
            $('.response').remove();
            console.clear();
          }

          var getQueryParams = function(str) {
            // usage: var params = getParams(url); value = params['key'];

            var queryString = str || window.location.search || '';
            var keyValPairs = [];
            var params      = {};
            queryString     = queryString.replace(/.*?\?/,"");

            if (queryString.length) {
              keyValPairs = queryString.split('&');
              for (pairNum in keyValPairs) {
                var key = keyValPairs[pairNum].split('=')[0];
                if (!key.length) continue;
                if (typeof params[key] === 'undefined')
                params[key] = [];
                params[key].push(keyValPairs[pairNum].split('=')[1]);
              }
            }
            return params;
          }

          var escapeHtml = function(string) {
            var entityMap = {
              "&": "&amp;",
              "<": "&lt;",
              ">": "&gt;",
              '"': '&quot;',
              "'": '&##39;',
              "/": '&##x2F;'
            };
            return String(string).replace(/[&<>"'\/]/g, function (s) {
              return entityMap[s];
            });
          }

      });
    </script>

  </head>
  <body>

    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2>Mura JSON API Tests</h2>
          <p class="minor">
            <a class="minor" href="http://docs.getmura.com/v5-1/mura-developers/mura-rendering/json-api/" target="_blank">JSON API Documentation &raquo;</a><br>
            Current SiteID: <strong>#session.siteid#</strong><br>
            Home Page ContentID: <strong>00000000000000000000000000000000001</strong></p>

        </div>
      </div>
    </div>

    <div id="content" class="container">
      <div class="row">

        <div class="col-md-12">
          <h3>Test Endpoints</h3>
          <p>Click the label or form field, then click submit to test. <strong>Don't forget to open your console!</strong></p>
        </div>

        <!--- TEST ENDPOINTS --->

          <!--- 1. FindNew --->
            <div class="col-md-6">
              <label class="ep" name="findnew1" data-method="GET">FindNew (1)
                <input class="endpoint" type="text" value="#url.entityName#/new" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="findnew2" data-method="GET">FindNew (2)
                <input class="endpoint" type="text" value="?method=findnew&amp;siteid=default&amp;entityName=#url.entityName#" />
              </label>
            </div>

          <!--- 2. FindOne --->
            <div class="col-md-6">
              <label class="ep" name="findone1" data-method="GET">FindOne (1)
               <input class="endpoint" type="text" value="#url.entityName#/00000000000000000000000000000000001" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="findone2" data-method="GET">FindOne (2)
                <input class="endpoint" type="text" value="?method=findone&amp;siteid=default&amp;entityName=#url.entityName#&amp;id=00000000000000000000000000000000001" />
              </label>
            </div>

          <!--- 3. FindMany --->
            <div class="col-md-6">
              <label class="ep" name="findmany1" data-method="GET">FindMany (1)
                <input class="endpoint" type="text" value="#url.entityName#/00000000000000000000000000000000001,FF06F08B-2DA8-461A-A1E2081453557435" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="findmany2" data-method="GET">FindMany (2)
                <input class="endpoint" type="text" value="?method=findmany&amp;siteid=default&amp;entityName=#url.entityName#&amp;ids=00000000000000000000000000000000001,FF06F08B-2DA8-461A-A1E2081453557435" />
              </label>
            </div>

          <!--- 4. FindQuery --->
            <div class="col-md-6">
              <label class="ep" name="findquery1" data-method="GET">FindQuery (1)
                <input class="endpoint" type="text" value="#url.entityName#/?fields=title,summary,contentid&amp;sort=title&amp;maxitems=50&amp;itemsperpage=10&amp;pageindex=1" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="findquery2" data-method="GET">FindQuery (2)
                <input class="endpoint" type="text" value="?method=findquery&amp;siteid=default&amp;entityName=#url.entityName#&amp;fields=title,summary,contentid&amp;sort=title&amp;maxitems=50&amp;itemsperpage=10&amp;pageindex=1" />
              </label>
            </div>
        

          <!--- 5. Logout --->
            <div class="col-md-6">
              <label class="ep" name="logout1" data-method="POST">Logout (1)
                <input class="endpoint" type="text" value="logout" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="logout2" data-method="POST">Logout (2)
                <input class="endpoint" type="text" value="?method=logout" />
              </label>
            </div>

          <!--- 6. Login --->
            <div class="col-md-6">
              <label class="ep" name="login1" data-method="POST">Login (1)
                <input class="endpoint" type="text" value="login/?username=admin&amp;password=admin" />
              </label>
            </div>
            <div class="col-md-6">
              <label class="ep" name="login2" data-method="POST">Login (2)
                <input class="endpoint" type="text" value="?method=login&amp;siteid=default&amp;username=admin&amp;password=admin" />
              </label>
            </div>

          <!--- 7. GenerateCSRFTokens --->
            <div class="col-md-6">
              <label class="ep" name="tokens1" data-method="GET">GenerateCSRFTokens
                <input class="endpoint" type="text" value="?method=generateCSRFTokens&amp;siteid=default&amp;context=00000000000000000000000000000000001" />
              </label>
            </div>

          <!--- 8. delete --->
            <div class="col-md-6">
              <label class="ep" name="delete" data-method="DELETE">Delete
                <input class="endpoint" type="text" value="?method=delete&amp;id=00000000000000000000000000000000001&amp;entityName=#url.entityName#&amp;siteid=default" />
              </label>
            </div>

          <!--- 9. consume content --->
          <cfif url.entityName eq 'content'>
            <div class="col-md-6">
              <label class="ep" name="content-consumption" data-method="GET">Content Consumption
                <input class="endpoint" type="text" value="content/_path/about" />
              </label>
            </div>
          </cfif>

        <!--- /Test Endpoints --->

      </div>

      <div class="row">
        <!--- FORM --->
          <div class="col-md-12">

            <h3>Test Form</h3>
            <p>You shouldn't have to modify anything other than specific content IDs if clicking the test endpoints.</p>
            <form id="frm" method="POST" action="">

                <div class="form-group">
                  <label for="method">Method:</label>
                  <select class="form-control" id="method" name="method">
                    <option value="GET" <cfif form.method eq 'GET'>selected</cfif>>GET</option>
                    <option value="POST" <cfif form.method eq 'POST'>selected</cfif>>POST</option>
                    <option value="DELETE" <cfif form.method eq 'DELETE'>selected</cfif>>DELETE</option>
                  </select>
                </div>

                <div class="form-group">
                  <label>Endpoint:
                    <input class="form-control" type="text" name="endpoint" value="#form.endpoint#">
                  </label>
                </div>

              <div>
                <input class="btn btn-default" type="submit" value="Submit">
              </div>
            </form>


            <!--- Loader --->
              <div id="loading" class="col-md-12">Loading ...</div>
          </div>
        <!--- /Form --->

        <!--- Result --->
          <div id="result" class="col-md-12"></div>

      </div>

    </div>
  </body>
  </html>
</cfoutput>