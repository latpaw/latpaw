$(document).ready ->
	$('.commands')
		.prepend '<div class="command"><p> <%= link_to @command.name, @command %>  </p> <p><b>功能描述:</b><%= raw(@command.desc) %></p></div>'