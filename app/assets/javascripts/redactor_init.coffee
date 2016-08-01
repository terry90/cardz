$ ->
  $('.redactor').each ->
    $(this).redactor
      air: true
      formattingAdd: 'white':
        title: 'White'
        args: [
          'p'
          { 'class': 'white' }
        ]
      #TODO: Set time (10s ?)
      autosave: $(this).data('url')
      callbacks: {
        autosave: (name, json) ->
          UIkit.notify({
            message : 'Votre lieu a été sauvegardé avec succès !',
            status  : 'success',
            timeout : 5000,
            pos     : 'bottom-right'
          });
        autosaveError: (name, json) ->
          UIkit.notify({
            message : 'Une erreur est survenue lors de la sauvegarde de votre lieu.',
            status  : 'danger',
            timeout : 5000,
            pos     : 'bottom-right'
          });
      }
  UIkit.grid $('.cards-container:not(.after-load)')