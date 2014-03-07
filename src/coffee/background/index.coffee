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

window.devGibBackgroundApp = new DevGib.Background.App()
$(document).ready -> window.devGibBackgroundApp.run()