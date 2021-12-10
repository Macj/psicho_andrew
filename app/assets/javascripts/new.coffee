$( document ).on 'turbolinks:load', ()->
  $('#error_block').hide()
  $('.thank_you_block').hide()
  $('.mob_thank_you_block').hide()      

  $('#new_client').on 'submit', (e)->
    console.log('before form submit')
    e.preventDefault()
    $.ajax({
        url:     "/clients",
        type:     "POST",
        dataType: "html",
        data: $("#new_client").serialize(),
        success: -> 
          window.location.href = "http://www.tkachenkoandrey.com/thank-you.html";
        ,
        error: ->
          $('#error_block').show()
          $('#error_block').html('Ошибка. Данные не отправлены.')
    })
        
  $('#close_ty_block').on 'click', (e)->
    console.log("close block")
    e.preventDefault()
    $('.thank_you_block').hide()

  $('#mob_close_ty_block').on 'click', (e)->
    console.log("Mob close block")
    e.preventDefault()
    $('.mob_thank_you_block').hide()


  $('#mob_client_form').on 'submit', (e)->
    console.log('before form submit')
    e.preventDefault()
    $.ajax({
        url:     "/clients",
        type:     "POST",
        dataType: "html",
        data: $("#mob_client_form").serialize(),
        success: -> 
          window.location.href = "http://www.tkachenkoandrey.com/thank-you.html";
        ,
        error: ->
          $('#error_block').show()
          $('#error_block').html('Ошибка. Данные не отправлены.')
    })
