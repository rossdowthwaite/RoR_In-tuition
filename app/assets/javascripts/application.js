// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require best_in_place
//= require_tree .
//= require jquery.nested-fields
//= require jquery-ui-timepicker-addon
//= require bootstrap-datepicker
//= require bootstrap-timepicker


$(document).ready(function() {
  alert('hello');
  $("#students ,#prices ").nestedFields();

//github.com/Nerian/bootstrap-datepicker-rails

  $(".datepicker").datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
});


