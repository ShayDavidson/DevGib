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
    anchors = @_getUntaggedPageAnchors()
    _.each(anchors, (anchor) =>
      anchor = $(anchor)
      anchor.attr('data-devgib', 'tagged')

      url = anchor.attr('href')
      return unless url
      sanitizedURL = @_sanitizedURL(url)

      message = {type: 'anchor', data: {url: sanitizedURL, classes: anchor.attr('class')}}
      chrome.runtime.sendMessage(message, (response) ->
        if response.siteData
          icon = new DevGib.Content.Icons.IconController(anchor, sanitizedURL, response.siteData)
          icon.show()
      )
    )

  _sanitizedURL: (url) ->
    if url.indexOf('http') < 0
      "#{window.location.protocol}//#{window.location.hostname}#{url}"
    else
      url

  _getUntaggedPageAnchors: ->
    $(document).find("a:not([data-devgib='tagged'])")