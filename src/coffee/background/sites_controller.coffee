class DevGib.Background.SitesController

  run: ->
    @sites = @_buildSites()
    @_bindToEvents()

  _buildSites: ->
    siteClasses = _.values(DevGib.Background.Sites)
    _.map(siteClasses, (siteClass) -> new siteClass())

  _bindToEvents: ->
    chrome.runtime.onMessage.addListener((request, _, sendResponse) =>
      switch request.type
        when 'anchor' then @_handleAnchorRequest(request.data, sendResponse)
    )

  _handleAnchorRequest: (data, sendResponse) ->
    foundSite = _.find(@sites, (site) -> site.isURLMatching(data.url))
    sendResponse(siteData: foundSite.siteDataAsJSON()) if foundSite?.areClassesAllowed(data.classes)

