# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$( document ).on 'turbolinks:load', ()->
  $("#collapseBack").hide()
  $('.work-block').hide()
  $("#multiCollapseWork").hide()
  $("#multiCollapseExpo2").hide()
  $(".princip").hide()
  $("#princOne").show()

  $("#collapseContractOne").hide()
  $("#collapseContractOneBack").hide()
  $("#collapseConsultOne").show()

  $(".btn-consult").on 'click', (e)->
    e.preventDefault()
    point = $(this).attr('data-target')
    $(".collapse-consult").hide()
    $("#" + point).css('display', 'block')

  $("#consult").on 'mouseover', ->
    $("#sub_consult").show()

  $("#consult").on 'mouseleave', ->   
    $("#sub_consult").hide()

  $("#close_contract").on 'click', ->
    $("#collapseContractOne").css("display","none")
    $("#collapseContractOneBack").css("display","none")

  $(".contract_button").on 'click', (e)->
    $("#collapseContractOne").show()
    $("#collapseContractOneBack").show()
    e.preventDefault()

  $(".get-service").on 'click', (e)->
    e.preventDefault()
    value = document.getElementById('request_comment').value
    target = $(this).attr('data-target')
    $(".service").removeClass('selected')
    $('#'+target).addClass("selected")
    document.getElementById('request_comment').value = $(this).attr('data')  + "\n" + value;

  $("#client_form_close").on 'click', ->
    $("#client_form").hide()
    $("#collapseBack").hide() 

  $(".client_form_show").on 'mousedown', ->
    $("#client_form").show()
    $("#collapseBack").show()

  $("#expo_btn").on 'click', ->
    $("#multiCollapseExpo2").toggle("slow")
    $('.work-block').hide()

  $("#work_btn").on 'click', ->
    $("#multiCollapseWork").toggle("slow")
    $('.work-block').hide()

  $(".work-cur-btn").on 'click', ->
    id = $(this).attr('href')
    $("#multiCollapseExpo2").hide()
    $('.work-block').hide()
    $(id).show("slow")    


  $(".princip-btn").on 'click', ->
    $(".princip").hide()
    id = $(this).attr('href')
    $(id).show()

  $('#search_submit').on 'click', ->
    $('#search').submit()
