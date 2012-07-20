$('.<%= dom_id @tag %>')
  .fadeOut ->
    $(this).remove()

unless $(".tagname").length == 0
            $(".empty").show(1000)