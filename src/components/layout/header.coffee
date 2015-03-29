class Video
  constructor: (config) ->
    @video = config.video
    @trigger = config.trigger
    @closer = config.closer
    @disabledCls = config.disabledCls or 'is-disabled'
    @init()


  init: =>
    @trigger.click =>
      @video.removeClass @disabledCls

    @closer.click =>
      @video.addClass @disabledCls





new Video(
  video: $('.site-header__video')
  trigger: $('.site-header__video__trigger')
  closer: $('.site-header__video__closer')
)