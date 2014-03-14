$(document).ready ->
  sitesController = chrome.extension.getBackgroundPage().sitesController
  _.each(sitesController.sites, (site) ->

    if site.accessTokenKey
      siteRow = $(".site.#{site.key}")
      inputField = siteRow.find('input.token')
      inputField.val(site.getAccessToken())
      inputField.keyup(=> site.setAccessToken(inputField.val()))
      inputField.change(=> site.setAccessToken(inputField.val()))

  )