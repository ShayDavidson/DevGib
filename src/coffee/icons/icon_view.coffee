class DevGib.Icons.IconView

  @SPINNER_ICON: '&#xf110;'
  @PADDING_CHAR: '&nbsp;'
  @SPINNING_CLASS: 'spinning'

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
    @spanEl.addClass(@constructor.SPINNING_CLASS)
    @spanEl.html("#{@constructor.SPINNER_ICON}#{@constructor.PADDING_CHAR}")

  showScore: (score) ->
    @spanEl.removeClass(@constructor.SPINNING_CLASS)
    @spanEl.addClass("#{@DEVGIB_SCORE_CLASS_PREFIX}-#{score}")
    @spanEl.html("#{@siteModel.icon}#{@constructor.PADDING_CHAR}")
    @spanEl.attr('title', "DevGib #{@siteModel.key} score is #{score}")



