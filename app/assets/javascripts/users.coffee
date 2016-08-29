# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

makeBackgroundCover = (div) ->
  if $(div + ' img').width() < $(div + ' img').height()
    $(div + ' img').css(
      'height': 'auto'
      'width': '100%'
    )
  else
    $(div + ' img').css(
      'height': '100%'
      'width': 'auto'
    )

loadImage = ->
  makeBackgroundCover('.avatar-image')

$ ->
  $('.upload-button input').change( ->
    preview = document.querySelector('.avatar-image img')
    file = document.querySelector('input[type=file]').files[0]
    reader = new FileReader

    reader.onloadend = ->
      preview.src = reader.result
      makeBackgroundCover('.avatar-image')
    if file
      reader.readAsDataURL file
  )

  $('.avatar-image img').click( ->
    $('.upload-button input').click()
  )

$(document).on('turbolinks:load', loadImage);