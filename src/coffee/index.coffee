class DevGib.Extension

    run: ->
      sites = @_getTargetSites()
      anchors = @_getPageAnchors()
      _.each(anchors, (anchor) ->
        anchor = $(anchor)
        anchor.attr('data-devgib', 'tagged')

        href = anchor.attr('href')

        if site = _.find(sites, (site) -> site.isURLMatching(href))
          icon = new DevGib.Icons.IconView(anchor, site)
          icon.show()
      )

    _getPageAnchors: ->
      $(document).find("a:not([data-devgib='tagged'])")

    _getTargetSites: ->
      [
        new DevGib.Sites.Stackoverflow(),
        new DevGib.Sites.Github()
      ]

    @sharedInstance: ->
      @_instance = new DevGib.Extension() unless @_instance
      return @_instance


# run

run = -> DevGib.Extension.sharedInstance().run()
runNodeInserted = ->
  $(document).unbind 'DOMNodeInserted'
  run()
  $(document).bind 'DOMNodeInserted', runNodeInserted

$(document).ready run
$(document).bind 'DOMNodeInserted', runNodeInserted