class DevGib.Extension

    run: ->
      sites = @_getTargetSites()
      anchors = @_getPageAnchors()

      _.each(anchors, (anchor) =>
        anchor = $(anchor)
        anchor.attr('data-devgib', 'tagged')

        url = anchor.attr('href')
        return unless url
        sanitizedURL = @_sanitizedURL(url)

        if site = _.find(sites, (site) -> site.isURLMatching(sanitizedURL))
          icon = new DevGib.Icons.IconController(anchor, sanitizedURL, site)
          icon.show()
      )

    _sanitizedURL: (url) ->
      if url.indexOf('http') < 0
        "#{window.location.protocol}//#{window.location.hostname}#{url}"
      else
        url

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


### Running ########################################################

run = -> DevGib.Extension.sharedInstance().run()
runNodeInserted = ->
  $(document).unbind 'DOMNodeInserted'
  run()
  $(document).bind 'DOMNodeInserted', runNodeInserted

$(document).ready run
$(document).bind 'DOMNodeInserted', runNodeInserted

####################################################################