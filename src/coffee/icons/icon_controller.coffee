class DevGib.Icons.IconController

  siteModel: null
  iconView: null

  constructor: (anchorEl, @siteModel) ->
    @iconView = new DevGib.Icons.IconView(anchorEl, siteModel)

  show: ->
    @iconView.show()
