# namespaces

window.DevGib =
  Icons: {}
  Sites: {}

# extension

$(document).ready ->

  sites = [
    new DevGib.Sites.Stackoverflow(),
    new DevGib.Sites.Github()
  ]

  anchors = $(document).find('a')

  _.each(anchors, (anchor) ->
    anchor = $(anchor)

    href = anchor.attr('href')
    dataHref = anchor.attr('data-href')

    site = _.find(sites, (site) ->
      site.isURLMatching(href) || site.isURLMatching(dataHref)
    )
    new DevGib.Icons.IconController(anchor, site) if site
  )