# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$( document ).ready ()->
	$('#v-cats-tab a').on 'mouseover', (e)->
	  e.preventDefault()
	  $(this).tab('show')

	$('#v-cats-tab a').on 'click', (e)->
	  e.preventDefault()
  	window.location.href = $(this).attr('href')
