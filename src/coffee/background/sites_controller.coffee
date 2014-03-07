class DevGib.Background.SitesController

  run: ->
    @sites = @_buildSites()

  _buildSites: ->
    siteClasses = _.values(DevGib.Background.Sites)
    siteObjects = _.map(siteClasses, (siteClass) -> new siteClass())
    _.inject(siteObjects, ((hash, siteObject) ->
      hash[siteObject.key] = siteObject
      hash
    ), {})


#        if site = _.find(sites, (site) -> site.isURLMatching(sanitizedURL) && !site.isAnchorBlackListed(anchor))
