# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$( document ).ready ()->
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