# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'ready page:load', ->
  $("#slid-cart").sideNav({edge: 'right'});
  $("#slid-menu").sideNav();
  $('select').material_select();
 