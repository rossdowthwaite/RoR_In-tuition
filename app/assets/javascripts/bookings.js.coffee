# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  jQuery ->
  	$("#recurring").click ->
    $("#recurring_fields").toggle()

  jQuery ->
  	$("#end_date").click ->
    $("#end_date_field").toggle()

$(document).ready(ready)
$(document).on('page:load', ready)