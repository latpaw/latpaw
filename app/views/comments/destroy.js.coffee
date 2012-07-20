$('#<%= dom_id(@comment)%>')
     .animate
   	 	height:0,
   	 	border:0
   	 	 , 1000, ->

a = $(".anum").html()
a = a - 1
$(".anum").html(a)