# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

loadGrid = ->
  $('[data-uk-grid]').on('beforeupdate.uk.grid', (e, children) ->
    setTimeout (->
      $('.after-load').fadeTo(400, 0)
      $('.cssload-thecube').fadeTo(400, 1)
    ), 500
  )

  $('[data-uk-grid]').on('afterupdate.uk.grid', (e, children) ->
    setTimeout (->
      $('.after-load').fadeTo(400, 1)
      $('.cssload-thecube').fadeTo(400, 0)
    ), 500
  )
  UIkit.grid($('.cards-container'))

$(document).on('turbolinks:load', loadGrid)