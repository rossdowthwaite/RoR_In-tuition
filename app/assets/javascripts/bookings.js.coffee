# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# toggles the recurring fields
ready = ->
  jQuery ->
  	$("#recurring").click ->
    $("#recurring_fields").toggle()

# toggles the the end date fields
  jQuery ->
  	$("#end_date").click ->
    $("#end_date_field").toggle()

$(document).ready(ready)
$(document).on('page:load', ready)

# formats the datepicker
$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
    altFormat: "yyyy-mm-dd"
    dateFormat: "yyyy-mm-dd"
    altField: $(this).next()
    autoclose: true
    weekStart: 1