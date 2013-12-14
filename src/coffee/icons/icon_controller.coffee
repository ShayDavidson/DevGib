class DevGib.Icons.IconController

  DEVGIB_SCORE_ICON_CLASS: 'devgib-score-icon'
  DEVGIB_SCORE_CLASS: 'score'

  anchorEl: null
  spanEl: null
  site: null

  constructor: (anchorEl, @site) ->

    score = 1

    @spanEl = $("<span>#{@site.icon}&nbsp;</span>")
    @spanEl.addClass(@DEVGIB_SCORE_ICON_CLASS)
    @spanEl.addClass(@site.key)
    @spanEl.addClass("#{@DEVGIB_SCORE_CLASS}-#{score}")
    @spanEl.attr('title', "DevGib - #{@site.key} score: #{score}")
    anchorEl.prepend(@spanEl)