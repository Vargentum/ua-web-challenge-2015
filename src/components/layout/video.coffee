class Video
  constructor: (config) ->
    @node = config.node
    @trigger = config.trigger
    @closer = config.closer
    @modifier = config.modifier or 'is-active'
    @destroyDelay = config.destroyDelay or 400
    @init()


  init: =>
    @trigger.click =>
      @node.vide('assets/video/header',
        posterType: 'jpg'
      )
      @node.addClass @modifier

    @closer.click =>
      @node.removeClass @modifier
      setTimeout => 
        @node.data('vide').destroy()
      , @destroyDelay






new Video(
  node: $('.site-header__video')
  trigger: $('.site-header__video__trigger')
  closer: $('.site-header__video__closer')
)