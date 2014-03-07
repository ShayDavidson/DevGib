class DevGib.Content.AnchorTagger

  run: ->
    @_tagAnchors()
    @_bindToEvents()

  _bindToEvents: ->
    _.bindAll(@, '_unbindTemporarilyAndTagAnchors')
    $(document).bind('DOMNodeInserted', @_unbindTemporarilyAndTagAnchors)

  _unbindTemporarilyAndTagAnchors: ->
    $(document).unbind('DOMNodeInserted')
    @run()
    $(document).bind('DOMNodeInserted', @_unbindTemporarilyAndTagAnchors)

  _tagAnchors: ->
    anchors = @_getPageAnchors()

    _.each(anchors, (anchor) =>
      anchor = $(anchor)
      anchor.attr('data-devgib', 'tagged')

      url = anchor.attr('href')
      return unless url
      sanitizedURL = @_sanitizedURL(url)
#
#        if site = _.find(sites, (site) -> site.isURLMatching(sanitizedURL) && !site.isAnchorBlackListed(anchor))
#          icon = new DevGib.Content.Icons.IconController(anchor, sanitizedURL, site)
#          icon.show()
    )

  _sanitizedURL: (url) ->
    if url.indexOf('http') < 0
      "#{window.location.protocol}//#{window.location.hostname}#{url}"
    else
      url

  _getPageAnchors: ->
    $(document).find("a:not([data-devgib='tagged'])")
