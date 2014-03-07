class DevGib.Background.App

    run: ->
      @sites = @_buildSites()

    _buildSites: ->
      siteClasses = _.values(DevGib.Background.Sites)
      siteObjects = _.map(siteClasses, (siteClass) -> new siteClass())
      _.inject(siteObjects, ((hash, siteObject) ->
        hash[siteObject.key] = siteObject
        hash
      ), {})


#### Main #####################################################################

$(document).ready ->
  window.devGibApp = new DevGib.Background.App()
  window.devGibApp.run()