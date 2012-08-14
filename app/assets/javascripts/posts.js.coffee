# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('.wideview').click () ->
     position = document.documentElement.scrollTop + 20
     width = document.body.clientWidth
     height = document.body.clientHeight
     o = $('#overlay')
     o.css "display","block"
     o.css "position","absolute"
     o.css "left","0"
     o.css "top","0"
     o.css "width",width
     o.css "height",height
     o.css "opacity","0"
     o.css "background","#000"
     o.animate
       opacity:0.5
     , 1000, ->

     v = $('#video')
     v.css "position","absolute"
     v.css "display","block"
     v.css "z-index","2000"
     v.css "left","15%"
     v.css "top", position
     v.css "opacity","0"
     v.css "width","1000"
     v.animate
       opacity:1,
       width:1000
     , 1000, ->

  $('#overlay').click () ->
     $('#overlay').css "display","none"
     $('#video').css "position","relative"
     $('#video').css "left","0"
     $('#video').css "top","0"
     $('#video').animate
       width:633
     , 1000, ->

  $('a.css2,a.css1,a.css3,a.css4').hover (->
     @id = "activetag"
     aa = $("#activetag")
     wid = aa.css("width")
     aa.css "font-size","26px"
     aa.css "width", wid
     aa.css "box-shadow","0 1px 2px rgba(0,0,0,1)"
     ), ->
     $("#activetag").css "box-shadow","none"
     $("#activetag").css "font-size","1.2em"
     @id = ""
