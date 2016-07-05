# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Render the correct form depending on the email address (password for existing accounts, else card UID)
validateEmail = (email) ->
  re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  re.test email

enablePasswordError = ->
  $('.sign-in').submit((e) ->
    e.preventDefault()
    $.ajax({
      type: "POST",
      url: $(this).data('url'),
      data: { email: $('#user_email').val(), password: $('#user_password').val() },
      success:(data) ->
        $('.sign-in').unbind('submit').submit()
        return true
      error:(data) ->
        $('.error-popover').fadeIn(400, () ->
          $(this).removeClass('hidden')
        )
        return false
    })
  )

enableCardError = ->
  $('#new_user').submit((e) ->
    e.preventDefault()
    $.ajax({
      type: "POST",
      url: $(this).data('url'),
      data: { card: $("#user_cards_attributes_uid").val() },
      success:(data) ->
        $('#new_user').unbind('submit').submit()
        return true
      error:(data) ->
        $('.error-popover').fadeIn(400, () ->
          $(this).removeClass('hidden')
        )
        return false
    })
  )

landingForm = ->
  $('.check-email').click(() ->
    if validateEmail($('.email-input').val())
      $.ajax({
        type: "POST",
        url: $(this).data('url'),
        data: { email: $("input[name=email]").val() },
        success:(data) ->
          $('.home-form').html(data)
          enablePasswordError()
          enableCardError()
        error:(data) ->
          $('.error-popover').fadeIn(400, () ->
            $(this).removeClass('hidden')
          )
          return false
      })
    else
      $('.error-popover').fadeIn(400, () ->
        $(this).removeClass('hidden')
      )
  )
$(document).on('turbolinks:load', landingForm)