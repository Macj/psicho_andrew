# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$( document ).ready ()->
  $("#collapseContractOne").hide()
  $("#collapseContractOneBack").hide()
  $("#collapseBack").hide()
  $('.work-block').hide()
  $("#multiCollapseWork").hide()
  $("#multiCollapseExpo2").hide()
  $(".princip").hide()
  $("#princOne").show()

  $("#consult").on 'mouseover', ->
    $("#sub_consult").show()

  $("#consult").on 'mouseleave', ->   
    $("#sub_consult").hide()

  $("#close_contract").on 'click', ->
    $("#collapseContractOne").hide()
    $("#collapseContractOneBack").hide()

  $(".contract_button").on 'click', (e)->
    e.preventDefault()
    $("#collapseContractOne").show()
    $("#collapseContractOneBack").show()

  $(".get-service").on 'click', (e)->
    e.preventDefault()
    console.log("get service")
    $('#request_comment').value = "HAHA"
    target = $(this).attr('data-target')
    $(".service").removeClass('selected')
    $('#'+target).addClass("selected")
    $('#request_comment').text( $(this).attr('data') )

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

  $(".work-cur-btn").on 'click', ->
    id = $(this).attr('href')
    $("#multiCollapseExpo2").hide()
    $('.work-block').hide()
    $(id).show("slow")    


  $(".princip-btn").on 'click', ->
    $(".princip").hide()
    id = $(this).attr('href')
    console.log(id)
    $(id).show("slow")

  $('#search_submit').on 'click', ->
    $('#search').submit()
