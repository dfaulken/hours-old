$(document).ready ->
  $('.shifts').on 'click', 'button.add-shift', (event) ->
    $(this).hide()
    $('.new-shift[data-index=' + $(this).data('index') + ']').show()
