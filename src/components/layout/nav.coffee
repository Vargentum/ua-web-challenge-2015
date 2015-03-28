class Nav
  constructor:(config) ->
    @trigger = config.trigger
    @node = config.node
    @activeCls = config.activeCls or 'is-active'
    @init()


  init: =>
    @trigger.click =>
      @node.toggleClass @activeCls
      @trigger.toggleClass @activeCls


new Nav(
  node: $('.site-nav')
  trigger: $('.site-nav__trigger')
)