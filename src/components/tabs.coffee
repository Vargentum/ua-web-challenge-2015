class Tabs
  
  constructor: (config) ->
    @nav = config.nav
    @pane = config.pane
    @activeCls = config.activeCls or 'is-active'
    @init()


  switch: (i) =>
    @pane.removeClass @activeCls
    $(@pane[i]).addClass @activeCls
    console.log($(@pane[i]))

    @nav.removeClass @activeCls
    $(@nav[i]).addClass @activeCls


  init: =>
    @nav.click (event) =>
      @switch( $(event.target).index() )



class CustomBgTabs extends Tabs

  constructor: (config) ->
    @container = config.container
    @containerMod = config.containerMod or 'pane-'
    super(config)

  changeBgStatus: (i) =>
    @container.removeClass (index, css) ->
      (css.match(/(^|\s)pane-\d+/g) || []).join(' ')
    @container.addClass(@containerMod + (i + 1))
  
  switch: (i) =>
    @changeBgStatus(i)
    super(i)




new CustomBgTabs(
  nav: $('.s-for-whom__nav__unit')
  pane: $('.s-for-whom__content__section')
  container: $('.s-for-whom__container')
)