class DevGib.Icons.IconController

  siteModel: null
  iconView: null
  url: null

  constructor: (anchorEl, @url, @siteModel) ->
    @iconView = new DevGib.Icons.IconView(anchorEl, siteModel)

  show: ->
    @iconView.attach()
    @iconView.showSpinner()
