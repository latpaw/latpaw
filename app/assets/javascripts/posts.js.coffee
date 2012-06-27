# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('.wideview').click () ->
     $('#video').css "position","relative"
     $('#video').css "display","block"
     $('#video').css "z-index","2000"
     $('#video').animate
       width:1000
     , 1000, ->

  $('.normalview').click () ->
     $('#video').animate
       width:551
     , 1000, ->