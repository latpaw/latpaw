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
     v.css "left","10%"
     v.css "top", position
     v.css "opacity","0"
     v.css "width","1000"
     v.animate
       opacity:1
       #width:1000
     , 1000, ->

  $('#overlay').click () ->
     $('#overlay').css "display","none"
     $('#video').css "position","relative"
     $('#video').css "left","0"
     $('#video').css "top","0"
     $('#video').animate
       width:551
     , 1000, ->

