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




###Custom Background Tabs###
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



###Tabs with sliders###
class TabsWithSlider extends Tabs

  constructor: (config) ->
    @sliderConfig = config.slider.config
    
    @sliderConfig.onSliderLoad = =>
      @countSlides 'all'
    @sliderConfig.onSlideBefore = =>
      @countSlides()
    @sliderConfig.onSlideAfter = =>
      @countSlides()

    @sliderNode = config.slider.node
    @slider = @sliderNode.bxSlider(@sliderConfig)
    @initChildren = @sliderNode.children()
    @type = config.type or 'speakers-type'
    @disabledCls = config.disabledCls or 'is-disabled'
    @showAllMark = config.showAllMark or 'all'
    @currentCounter = @sliderConfig.currentCounter
    @totalCounter = @sliderConfig.totalCounter

    super(config)


  countSlides: (type) =>
    @currentCounter.text @slider.getCurrentSlide() + 1
    if type is 'all'
      @totalCounter.text @slider.getSlideCount()



  reloadSlider:  =>
    @slider.reloadSlider()
    @countSlides 'all'


  filter: (type) =>
    if type is @showAllMark
      @sliderNode.children().remove()
      @sliderNode.append(@initChildren)
      @reloadSlider()

    else 
      @sliderNode.empty()
      @pane.each (index) =>
        $currentPane = $(@pane[index])

        if $currentPane.data(@type) is type
          @sliderNode.append $currentPane

        if index == (@pane.length - 1)
          @reloadSlider()


  switch: (i) =>
    $currentNav = $(@nav[i])
    activeType = $currentNav.data(@type)

    @nav.removeClass @activeCls
    $currentNav.addClass @activeCls

    @filter activeType



new TabsWithSlider(
  nav: $('.s-speakers__nav__unit')
  pane: $('.s-speakers__person')
  slider: 
    node: $('.s-speakers__slider')
    config:
      carousel: on
      minSlides: 1
      maxSlides: 6
      moveSlides: 1
      slideWidth: 165
      slideMargin: 30
      pager: off
      infiniteLoop: off
      auto: on
      autoHover: on
      controls: on
      hideControlOnEnd: on
      nextText: ''
      prevText: ''
      prevSelector: $('.s-speakers__slider__arrows__unit.prev')
      nextSelector: $('.s-speakers__slider__arrows__unit.next')
      currentCounter: $('.s-speakers__slider__counter.current')
      totalCounter: $('.s-speakers__slider__counter.total')
)
