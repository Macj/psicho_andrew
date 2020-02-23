# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$( document ).on 'turbolinks:load', ()->
	$('#v-cats-tab a').on 'mouseover', (e)->
	  e.preventDefault()
	  $(this).tab('show')
	  logo = '#logo-' + $(this).attr('aria-controls')
	  $('.logo-v-cats').hide()
	  $(logo).css('display', 'block')

	$('#v-cats-tab a').on 'mouseleave', (e)->
	  e.preventDefault()
	  logo = '#logo-' + $(this).attr('aria-controls')
	  $(logo).css('display', 'none')

	$('#v-cats-tab a').on 'click', (e)->
	  e.preventDefault()
  	window.location.href = $(this).attr('href')


