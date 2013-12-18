class DevGib.Icons.IconView

  @SPINNER_ICON: '&#xf110;'
  @ERROR_ICON: '&#xf11a;'
  @SPINNER_CLASS: 'spinner'
  @ERROR_CLASS: 'error'

  DEVGIB_SCORE_ICON_CLASS: 'devgib-score-icon'
  DEVGIB_SCORE_CLASS_PREFIX: 'score'

  anchorEl: null
  spanEl: null
  siteModel: null

  constructor: (@anchorEl, @siteModel) ->
    @spanEl = $("<span></span>")
    @spanEl.addClass(@DEVGIB_SCORE_ICON_CLASS)
    @spanEl.addClass(@siteModel.key)
    @spanEl.attr('title', "Loading DevGib score from #{@siteModel.key}")

  attach: ->
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
    @spanEl.addClass("#{@DEVGIB_SCORE_CLASS_PREFIX}-#{score}")
    @spanEl.attr('title', "DevGib #{@siteModel.key} score is #{score}")
    @_showIcon(@siteModel.icon)

  _showIcon: (icon) ->
    @spanEl.html("#{icon}&nbsp;")



