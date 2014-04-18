# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	$("#images_tab").click ->
	  $("#images").show()
	  $("#documents").hide()
	  $("#all").hide()
	$("#documents_tab").click ->
	  $("#documents").show()
	  $("#images").hide()
	  $("#all").hide()
	$("#all_tab").click ->
	  $("#documents").hide()
	  $("#images").hide()
	  $("#all").show()