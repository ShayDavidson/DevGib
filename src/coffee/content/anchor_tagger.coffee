class DevGib.Content.AnchorTagger

  MAX_PARENTS_CLASS_LEVEL = 2

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

      classes =  @_anchorAllClasses(anchor, MAX_PARENTS_CLASS_LEVEL)

      message = {type: 'anchor', data: {url: sanitizedURL, classes: classes}}
      chrome.runtime.sendMessage(message, (response) ->
        if response.siteData
          icon = new DevGib.Content.Icons.IconController(anchor, sanitizedURL, response.siteData)
          icon.show()
      )
    )

  _anchorAllClasses: (anchor, level) ->
    classes = anchor.attr('class') || ""
    return classes if level == 0

    for i in [0..level]
      parentClass = anchor.parents(":eq(#{i})").attr('class')
      classes += " " + parentClass if parentClass
    classes

  _sanitizedURL: (url) ->
    if url.indexOf('http') < 0
      "#{window.location.protocol}//#{window.location.hostname}#{url}"
    else
      url

  _getUntaggedPageAnchors: ->
    $(document).find("a:not([data-devgib='tagged'])")