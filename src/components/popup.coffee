class Popup
  constructor: (config) ->
    trigger: @config.trigger
    content: @config.content
    theme: @config.theme
    popupCls: @config.popupCls or 'uv-popup'

  
  cratePopup: (content) =>
    popup = $('.uv-popup')


  init: =>
    creaetePopup @content


