# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Render the correct form depending on the email address (password for existing accounts, else card UID)
landingForm = ->
  $('.check-email').click(() ->
    $.ajax({
      type: "POST",
      url: $(this).data('url'),
      data: { email: $("input[name=email]").val() },
      success:(data) ->
        $('.home-form').html(data)
      error:(data) ->
        alert('SOUS MERDE') # TODO error
        return false
    })
  )

$(document).on('turbolinks:load', landingForm)