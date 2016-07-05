# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Render the correct form depending on the email address (password for existing accounts, else card UID)
validateEmail = (email) ->
  re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  re.test email

landingForm = ->
  $('.check-email').click(() ->
    if validateEmail($('.email-input').val())
      $.ajax({
        type: "POST",
        url: $(this).data('url'),
        data: { email: $("input[name=email]").val() },
        success:(data) ->
          $('.home-form').html(data)
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
                $('[data-toggle="popover"]').attr('data-content', $('[data-toggle="popover"]').data('error'))
                $('[data-toggle="popover"]').popover({ html: true })
                $('[data-toggle="popover"]').popover('show')
                return false
            })
          )
        error:(data) ->
          alert('SOUS MERDE') # TODO error
          return false
      })
    else
      popover = $('[data-toggle="popover"]').data('bs.popover');

      $('[data-toggle="popover"]').attr('data-content', $('[data-toggle="popover"]').data('error'))
      popover.setContent();
      popover.$tip.addClass(popover.options.placement)
      $('[data-toggle="popover"]').popover('show')
  )

  $('[data-toggle="popover"]').popover({ html: true })
  $('[data-toggle="popover"]').popover('show')

$(document).on('turbolinks:load', landingForm)