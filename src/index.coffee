# namespaces

window.DevGib =
  Sites: {}

# application

$(document).ready ->

  sites = [
    new DevGib.Sites.Stackoverflow(),
    new DevGib.Sites.Github()
  ]

  anchors = $(document).find('a')
  matchingAnchors = []

  filtered_anchors = _.filter(anchors, (anchor) ->
    anchor = $(anchor)
    url = anchor.attr('href')
    site = _.find(sites, (site) ->
      site.isURLMatching(url)
    )
    matchingAnchors.push(anchor: anchor, site: site) if site
  )