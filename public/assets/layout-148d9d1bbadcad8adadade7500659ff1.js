(function(a){var b=function(){var b=window.location.hash.replace("#",""),d=a("ul.navigationTabs a").bind("click",c).filter("a[rel="+b+"]");d.size()==0&&(d=a("ul.navigationTabs a:first")),c.apply(d.get(0)),a("#colorpickerHolder").ColorPicker({flat:!0}),a("#colorpickerHolder2").ColorPicker({flat:!0,color:"#00ff00",onSubmit:function(b,c,d){a("#colorSelector2 div").css("backgroundColor","#"+c)}}),a("#colorpickerHolder2>div").css("position","absolute");var e=!1;a("#colorSelector2").bind("click",function(){a("#colorpickerHolder2").stop().animate({height:e?0:173},500),e=!e}),a("#colorpickerField1, #colorpickerField2, #colorpickerField3").ColorPicker({onSubmit:function(b,c,d,e){a(e).val(c),a(e).ColorPickerHide()},onBeforeShow:function(){a(this).ColorPickerSetColor(this.value)}}).bind("keyup",function(){a(this).ColorPickerSetColor(this.value)}),a("#colorSelector").ColorPicker({color:"#0000ff",onShow:function(b){return a(b).fadeIn(500),!1},onHide:function(b){return a(b).fadeOut(500),!1},onChange:function(b,c,d){a("#colorSelector div").css("backgroundColor","#"+c)}})},c=function(b){var c=a("ul.navigationTabs a").removeClass("active").index(this);a(this).addClass("active").blur(),a("div.tab").hide().eq(c).show()};EYE.register(b,"init")})(jQuery)