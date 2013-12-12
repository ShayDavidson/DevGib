#Stackoverflow = require('./sites/stackoverflow').Stackoverflow

$(document).ready ->

  sites = [new Stackoverflow()]

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

  console.log(filtered_anchors)
