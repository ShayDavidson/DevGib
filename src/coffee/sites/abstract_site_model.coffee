class DevGib.Sites.AbstractSiteModel

  #### Interface #######################################################

  key: null
  icon: null
  matchingURLRegex: null
  resourceIDRegex: null

  #### Abstract ########################################################

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingURLRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  fetchScoreForURL: (url, success, failure) -> # override by subclass.
    setTimeout((-> success(Math.floor(Math.random()*10) + 1)), Math.floor(Math.random()*2000 + 500))

  _getResourceIDFromURL: (url) ->
    url.match(@resourceIDRegex)


