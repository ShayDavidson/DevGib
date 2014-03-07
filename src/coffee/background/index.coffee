class DevGib.Background.App

    run: ->
      @sites = @_buildTargetSites()

    _buildTargetSites: ->
      siteClasses = _.values(DevGib.Background.Sites)
      _.map(siteClasses, (siteClass) -> new siteClass())


#### Main #####################################################################

app = new DevGib.Background.App()
app.run()
