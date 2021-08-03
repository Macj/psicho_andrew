$( document ).on 'turbolinks:load', ()->
  console.log("Form behavioure!!!!")
  $('#error_block').hide()
  $('.thank_you_block').hide()      

  $('#new_client').on 'submit', (e)->
    console.log('before form submit')
    e.preventDefault()
    $.ajax({
        url:     "/clients",
        type:     "POST",
        dataType: "html",
        data: $("#new_client").serialize(),
        success: -> 
          $('.thank_you_block').show()
        ,
        error: ->
          $('#error_block').show()
          $('#error_block').html('Ошибка. Данные не отправлены.')
    })
        
  $('#close_ty_block').on 'click', (e)->
    e.preventDefault()
    $('.thank_you_block').hide()

