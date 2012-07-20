$('.empty')
  .fadeOut ->
    $(this).hide(1000)

$('#alltag')
  .append('<%= render :partial=>"tag",:collection=>@tag %>')