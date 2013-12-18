class DevGib.Icons.IconView

  @SPINNER_ICON: '&#xf110;'
  @ERROR_ICON: '&#xf11a;'
  @SPINNER_CLASS: 'spinner'
  @ERROR_CLASS: 'error'

  @DEVGIB_ICON_SPACE_CLASS: 'devgib-icon-space'
  @DEVGIB_SCORE_ICON_CLASS: 'devgib-score-icon'
  @DEVGIB_SCORE_CLASS_PREFIX: 'score'

  anchorEl: null
  spanEl: null
  siteModel: null

  constructor: (@anchorEl, @siteModel) ->
    @spanEl = $("<span></span>")
    @spanEl.addClass(@constructor.DEVGIB_SCORE_ICON_CLASS)
    @spanEl.addClass(@siteModel.key)
    @spanEl.attr('title', "Loading DevGib score from #{@siteModel.key}")

  attach: ->
    @anchorEl.prepend($("<span class=#{@constructor.DEVGIB_ICON_SPACE_CLASS}>&nbsp;</span>"))
    @anchorEl.prepend(@spanEl)

  showSpinner: ->
    @spanEl.addClass(@constructor.SPINNER_CLASS)
    @_showIcon(@constructor.SPINNER_ICON)

  showError: ->
    @spanEl.removeClass(@constructor.SPINNER_CLASS)
    @spanEl.addClass(@constructor.ERROR_CLASS)
    @_showIcon(@constructor.ERROR_ICON)

  showScore: (score) ->
    @spanEl.removeClass(@constructor.SPINNER_CLASS)
    @spanEl.addClass("#{@constructor.DEVGIB_SCORE_CLASS_PREFIX}-#{score}")
    @spanEl.attr('title', "DevGib #{@siteModel.key} score is #{score}")
    @_showIcon(@siteModel.icon)

  _showIcon: (icon) ->
    @spanEl.html(icon)



