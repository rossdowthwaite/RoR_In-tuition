# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	$("#video").click ->
	  $("#video_field").show()
	  $("#text_field").hide()
	  $("#upload_field").hide()
	  $("#old_video").hide()
	$("#text").click ->
	  $("#text_field").show()
	  $("#video_field").hide()
	  $("#upload_field").hide()
	$("#upload").click ->
	  $("#upload_field").show()
	  $("#text_field").hide()
	  $("#video_field").hide()
	  $("#old_upload").hide()
	$("#new_video_tab").click ->
	  $("#new_video").show()
	  $("#old_video").hide()
	$("#old_video_tab").click ->
	  $("#old_video").show()
	  $("#new_video").hide()
	$("#new_upload_tab").click ->
	  $("#new_upload").show()
	  $("#old_upload").hide()
	$("#old_upload_tab").click ->
	  $("#old_upload").show()
	  $("#new_upload").hide()

jQuery ->
  $('.best_in_place').best_in_place()