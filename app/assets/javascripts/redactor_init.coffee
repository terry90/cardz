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
      autosave: $(this).data('url')
  UIkit.grid $('.cards-container:not(.after-load)')