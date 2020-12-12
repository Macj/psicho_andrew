# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$( document ).on 'turbolinks:load', ()->

#  $('.clockpicker').clockpicker({
#      placement: 'top',
#      align: 'left',
#      donetext: 'Done'
#  });

  $('#ajax').on 'click', ()->
    $.get( "/articles.js", (data)->
      console.log(data)
      $('#cards').append(data)
    )


  $('.wysihtml5').each (i, elem)->
    $(elem).wysihtml5(toolbar: {
    'font-styles': true,
    'color': true,
    'emphasis': {
      'small': true
    },
    'blockquote': true,
    'lists': true,
    'html': true,
    'link': true,
    'image': true,
    'smallmodals': true
    })

# filters func
  $('#artical_lists').hide()

  $('#filter_list').on 'click', (e)->
    e.preventDefault()
    $('#artical_blocks').hide()
    $('#artical_lists').show()

  $('#filter_block').on 'click', (e)->
    e.preventDefault()
    $('#artical_blocks').show()
    $('#artical_lists').hide()
