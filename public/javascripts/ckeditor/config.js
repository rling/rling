/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

//CKEDITOR.plugins.load( 'embed' );

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'ru';
  config.filebrowserBrowseUrl = 'someURL' 
  // config.uiColor = '#AADC6E';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;
  
  config.height = '400px';
  config.width = '600px';
  
  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;
  
  config.extraPlugins = "embed";
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];
};

CKEDITOR.replace( 'editor1',
{
   // Link dialog, "Browse Server" button
   //filebrowserBrowseUrl : '/ckfinder/ckfinder.html',
   // Image dialog, "Browse Server" button
  // filebrowserImageBrowseUrl : '/ckfinder/ckfinder.html?type=Images',
   // Flash dialog, "Browse Server" button
   //filebrowserFlashBrowseUrl : '/ckfinder/ckfinder.html?type=Flash',
   // Upload tab in the Link dialog
   filebrowserUploadUrl : '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
   // Upload tab in the Image dialog
   filebrowserImageUploadUrl : '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
   // Upload tab in the Flash dialog
   filebrowserFlashUploadUrl : '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
}  );