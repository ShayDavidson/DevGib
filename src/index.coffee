# namespaces

window.DevGib =
  Sites: {}

# application

$(document).ready ->

  DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon'
  DEVGIB_SCORE_CLASS = 'score'

  sites = [
    new DevGib.Sites.Stackoverflow(),
    new DevGib.Sites.Github()
  ]

  anchors = $(document).find('a')
  targets = []

  _.each(anchors, (anchor) ->
    anchor = $(anchor)

    href = anchor.attr('href')
    dataHref = anchor.attr('data-href')

    site = _.find(sites, (site) ->
      site.isURLMatching(href) || site.isURLMatching(dataHref)
    )
    targets.push(anchor: anchor, site: site) if site
  )

  _.each(targets, (target) ->
    score = 1
    scoreElement = $('<span>☢&nbsp;</span>')
    scoreElement.addClass(DEVGIB_SCORE_ICON_CLASS)
    scoreElement.addClass(target.site)
    scoreElement.addClass("#{DEVGIB_SCORE_CLASS}-score")
    target.anchor.prepend(scoreElement)
  )