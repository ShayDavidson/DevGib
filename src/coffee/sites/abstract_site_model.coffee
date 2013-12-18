class DevGib.Sites.AbstractSiteModel

  #### Interface #######################################################

  key: null
  icon: null
  matchingURLRegex: null
  resourceIDRegex: null

  fetchScoreForURL: (url, success, failure) ->

  #### Abstract ########################################################

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingURLRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  getResourceIDFromURL: (url) ->
    url.match(@resourceIDRegex)