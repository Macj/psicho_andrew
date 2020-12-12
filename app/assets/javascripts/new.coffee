$( document ).on 'turbolinks:load', ()->
  $('#error_block').hide()
  $('#thank_you_block').hide()      

  $('#new_request').on 'click', (e)->
    e.preventDefault()
    $.ajax({
        url:     "/clients",
        type:     "POST",
        dataType: "html",
        data: $("#new_client").serialize(),
        success: -> 
          $('#thank_you_block').show()
        ,
        error: ->
          $('#error_block').show()
          $('#error_block').html('Ошибка. Данные не отправлены.')
    })
        
  $('#close_ty_block').on 'click', (e)->
    e.preventDefault()
    $('#thank_you_block').hide()

