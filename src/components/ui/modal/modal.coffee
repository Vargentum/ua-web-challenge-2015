class Modal
  constructor: ->
    @init()
    @closer = $("<span class='uv-modal__closer'></span>")
    @container = $('<div>', {class: 'uv-modal__wrap'})

  renderPopup: ($trigger) =>
    $content = $trigger.find('.uv-modal__content')
    $theme = $trigger.data('theme')
    @container.addClass $theme
              .append $content
              .appendTo 'body'

    @closer.insertAfter $content
           .click => @container.remove()

  init: =>
    $('.uv-modal').click (evt) =>
      @renderPopup $(evt.currentTarget)



new Modal()