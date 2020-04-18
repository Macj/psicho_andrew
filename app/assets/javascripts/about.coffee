$( document ).ready ()->
  $('.find_out').hide()

  $('.find_out_card').hover ()->
    id = $(this).attr('ref')
    console.log(id)
    $(this).hide()
    $('#find_out' + id).show()
    $('#collapseCard' + id).show()

  $('.find_out').mouseout ()->
    id = $(this).attr('ref')
    $(this).hide()
    $('#collapseCard' + id).hide()
    $('#find_out_card' + id).show()

  $('.sub-card-body').mouseout ()->
    id = $(this).attr('ref')
    $(this).hide()
    $('#collapseCard' + id).hide()
    $('#find_out_card' + id).show()


  $('#aja').on 'click', ()->
    elem = $('.aja_block')