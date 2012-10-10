/**
 * Unobtrusive scripting adapter for jQuery
 *
 * Requires jQuery 1.4.3 or later.
 * https://github.com/rails/jquery-ujs
 
 * Uploading file using rails.js
 * 
 * By default, browsers do not allow files to be uploaded via AJAX. As a result, when this rails.js adapter submits remote forms,
 * any file input fields are excluded from the request parameters sent to the server. You may cancel the whole form submission by 
 * binding a handler function that returns false to the `ajax:aborted:file` hook.
 *
 * Ex:
 *     $('form').live('ajax:aborted:file', function(){
 *       alert("File detected. Form submission canceled.");
 *       return false;
 *     });
 *
 * The `ajax:aborted:file` event is fired when a form is submitted and both conditions are met:
 *   a) file-type input field is detected, and
 *   b) the value of the input:file field is not blank. 
 * 
 * Third party tools can use this hook to detect when an AJAX file upload is attempted, and then use techniques like the iframe method to upload the file instead.
 *
 * Similarly, rails.js aborts AJAX form submissions if any non-blank input[required] fields are detected, providing the `ajax:aborted:required` hook.
 * Unlike file uploads, however, blank required input fields cancel the whole form submission by default.
 */
(function(a){function b(b){var c=a('meta[name="csrf-token"]').attr("content");c&&b.setRequestHeader("X-CSRF-Token",c)}function c(b,c,d){var e=a.Event(c);return b.trigger(e,d),e.result!==!1}function d(b){var d,e,f,g=b.data("type")||a.ajaxSettings&&a.ajaxSettings.dataType;if(c(b,"ajax:before")){if(b.is("form")){d=b.attr("method"),e=b.attr("action"),f=b.serializeArray();var h=b.data("ujs:submit-button");h&&(f.push(h),b.data("ujs:submit-button",null))}else d=b.data("method"),e=b.attr("href"),f=null;a.ajax({url:e,type:d||"GET",data:f,dataType:g,beforeSend:function(a,d){return d.dataType===undefined&&a.setRequestHeader("accept","*/*;q=0.5, "+d.accepts.script),c(b,"ajax:beforeSend",[a,d])},success:function(a,c,d){b.trigger("ajax:success",[a,c,d])},complete:function(a,c){b.trigger("ajax:complete",[a,c])},error:function(a,c,d){b.trigger("ajax:error",[a,c,d])}})}}function e(b){var c=b.attr("href"),d=b.data("method"),e=a("meta[name=csrf-token]").attr("content"),f=a("meta[name=csrf-param]").attr("content"),g=a('<form method="post" action="'+c+'"></form>'),h='<input name="_method" value="'+d+'" type="hidden" />';f!==undefined&&e!==undefined&&(h+='<input name="'+f+'" value="'+e+'" type="hidden" />'),g.hide().append(h).appendTo("body"),g.submit()}function f(b){b.find("input[data-disable-with], button[data-disable-with]").each(function(){var b=a(this),c=b.is("button")?"html":"val";b.data("ujs:enable-with",b[c]()),b[c](b.data("disable-with")),b.attr("disabled","disabled")})}function g(b){b.find("input[data-disable-with]:disabled, button[data-disable-with]:disabled").each(function(){var b=a(this),c=b.is("button")?"html":"val";b.data("ujs:enable-with")&&b[c](b.data("ujs:enable-with")),b.removeAttr("disabled")})}function h(a){var b=a.data("confirm");return!b||c(a,"confirm")&&confirm(b)}function i(b,c){var d=!1,e=c||"input";return b.find(e).each(function(){a(this).val()||(d=!0)}),d}function j(b,c){var d=!1,e=c||"input";return b.find(e).each(function(){a(this).val()&&(d=!0)}),d}"ajaxPrefilter"in a?a.ajaxPrefilter(function(a,c,d){b(d)}):a(document).ajaxSend(function(a,c){b(c)}),a("a[data-confirm], a[data-method], a[data-remote]").live("click.rails",function(b){var c=a(this);if(!h(c))return!1;if(c.data("remote")!=undefined)return d(c),!1;if(c.data("method"))return e(c),!1}),a("form").live("submit.rails",function(b){var e=a(this),g=e.data("remote")!=undefined;if(!h(e))return!1;if(i(e,"input[name][required]"))return e.trigger("ajax:aborted:required"),!g;if(j(e,"input:file"))return c(e,"ajax:aborted:file");if(g)return d(e),!1;setTimeout(function(){f(e)},13)}),a("form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])").live("click.rails",function(){var b=a(this);if(!h(b))return!1;var c=b.attr("name"),d=c?{name:c,value:b.val()}:null;b.closest("form").data("ujs:submit-button",d)}),a("form").live("ajax:beforeSend.rails",function(b){this==b.target&&f(a(this))}),a("form").live("ajax:complete.rails",function(b){this==b.target&&g(a(this))})})(jQuery)