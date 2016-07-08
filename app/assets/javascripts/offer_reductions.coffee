# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.cards-container').shapeshift({
    enableDrag: false,
    enableCrossDrop: false,
    gutterX: 25,
    gutterY: 25 # 2 small offers = 1 big offer with that magin
  });