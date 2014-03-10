class DevGib.Background.SitesController

  run: ->
    @sites = @_buildSites()
    @sitesByKey = _.inject(@sites, ((hash, site) -> hash[site.key] = site; hash), {})
    @_bindToEvents()

  getAccessTokenForSite: (key) ->
    @sitesByKey[key].getAccessToken()

  _buildSites: ->
    siteClasses = _.values(DevGib.Background.Sites)
    _.map(siteClasses, (siteClass) -> new siteClass())

  _bindToEvents: ->
    @_bindToPopupEvents()
    @_bindToContentScriptsEvents()

  #### Popup Events #############################################################

  _bindToPopupEvents: ->
    $('input.token').change(-> alert('lol'))

  #### Content Script Events ####################################################

  _bindToContentScriptsEvents: ->
    chrome.runtime.onMessage.addListener((request, _, sendResponse) =>
      switch request.type
        when 'anchor' then @_handleAnchorRequest(request.data, sendResponse)
        when 'score'  then @_handleScoreRequest(request.data, sendResponse)
      true
    )

  _handleAnchorRequest: (data, sendResponse) ->
    foundSite = _.find(@sites, (site) -> site.isURLMatching(data.url))
    sendResponse(siteData: foundSite.siteDataAsJSON()) if foundSite?.areClassesAllowed(data.classes)

  _handleScoreRequest: (data, sendResponse) ->
    site = @sitesByKey[data.key]

    success = (score) ->
      sendResponse(score: score)

    failure = ->
      sendResponse(error: true)

    site.fetchScoreForURL(data.url, success, failure)
