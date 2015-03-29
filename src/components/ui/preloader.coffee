class Preloader
  constructor: (config) ->
    @wrap = config.wrap
    @modifier = config.modifier or 'is-disabled'
    @init()


  init: =>
    $(window).load =>
      @wrap.addClass @modifier


new Preloader(
  wrap: $('.site-preloader')
)