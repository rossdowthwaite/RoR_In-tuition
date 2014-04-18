# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".post_tab").click ->
    id = $(this).prop('id')
    tab = "#comment_form_" + id
    $(tab).slideToggle()
    return

  return

$(document).ready ->
  $("#create_post_tab").click ->
    $('#create_post').slideToggle()
    return

  return