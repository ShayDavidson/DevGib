class DevGib.Icons.IconView

  DEVGIB_SCORE_ICON_CLASS: 'devgib-score-icon'
  DEVGIB_SCORE_CLASS_PREFIX: 'score'

  anchorEl: null
  spanEl: null
  siteModel: null

  constructor: (@anchorEl, @siteModel) ->
    score = Math.floor(Math.random()*10) + 1
    @spanEl = $("<span>#{siteModel.icon}&nbsp;</span>")
    @spanEl.addClass(@DEVGIB_SCORE_ICON_CLASS)
    @spanEl.addClass(@siteModel.key)
    @spanEl.addClass("#{@DEVGIB_SCORE_CLASS_PREFIX}-#{score}")
    @spanEl.attr('title', "DevGib - #{@siteModel.key} score: #{score}")

  show: ->
    @anchorEl.prepend(@spanEl)
