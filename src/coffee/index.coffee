# namespaces

window.DevGib =
  Icons: {}
  Sites: {}

# extension

class DevGib.Extension

    run: ->
      sites = @_getTargetSites()
      anchors = @_getPageAnchors()
      _.each(anchors, (anchor) ->
        anchor = $(anchor)

        href = anchor.attr('href')

        if site = _.find(sites, (site) -> site.isURLMatching(href))
          icon = new DevGib.Icons.IconView(anchor, site)
          icon.show()
      )

    _getPageAnchors: ->
      $(document).find('a')

    _getTargetSites: ->
      [
        new DevGib.Sites.Stackoverflow(),
        new DevGib.Sites.Github()
      ]


# run

$(document).ready ->

  extension = new DevGib.Extension()
  setTimeout((-> extension.run()), 0)