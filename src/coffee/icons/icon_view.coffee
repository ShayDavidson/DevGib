class DevGib.Icons.IconView

  #### Constants #######################################################

  @SPINNER_ICON: '&#xf110;'
  @ERROR_ICON:   '&#xf11a;'

  @SPINNER_CLASS: 'devgib-spinner'
  @ERROR_CLASS:   'devgib-error'

  @ICON_SPACE_CLASS:   'devgib-icon-space'
  @SCORE_ICON_CLASS:   'devgib-score-icon'
  @SCORE_CLASS_PREFIX: 'devgib-score'

  @SPINNER_TITLE: "Loading DevGib score from %s"
  @SCORE_TITLE:   "DevGib %s score is %s"
  @ERROR_TITLE:   "DevGib failed fetching the link's score"

  #### Implementation ##################################################

  anchorEl: null
  spanEl: null
  siteModel: null

  constructor: (@anchorEl, @siteModel) ->
    @spanEl = $("<span></span>")
    @spanEl.addClass(@constructor.SCORE_ICON_CLASS)
    @spanEl.addClass(@siteModel.key)

  attach: ->
    @anchorEl.prepend($("<span class=#{@constructor.ICON_SPACE_CLASS}>&nbsp;</span>"))
    @anchorEl.prepend(@spanEl)

  showSpinner: ->
    @spanEl.addClass(@constructor.SPINNER_CLASS)
    @_showTitle(@constructor.SPINNER_TITLE, [@siteModel.key])
    @_showIcon(@constructor.SPINNER_ICON)

  showError: ->
    @spanEl.removeClass(@constructor.SPINNER_CLASS)
    @spanEl.addClass(@constructor.ERROR_CLASS)
    @_showTitle(@constructor.ERROR_TITLE)
    @_showIcon(@constructor.ERROR_ICON)

  showScore: (score) ->
    @spanEl.removeClass(@constructor.SPINNER_CLASS)
    @spanEl.addClass("#{@constructor.SCORE_CLASS_PREFIX}-#{score}")
    @_showTitle(@constructor.SCORE_TITLE, [@siteModel.key, score])
    @_showIcon(@siteModel.icon)

  _showTitle: (text, args = []) ->
    args.unshift(text)
    @spanEl.attr('title', _.string.sprintf.apply(null, args))

  _showIcon: (icon) ->
    @spanEl.html(icon)



