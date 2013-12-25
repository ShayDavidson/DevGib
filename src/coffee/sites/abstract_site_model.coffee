class DevGib.Sites.AbstractSiteModel

  #### Interface #######################################################

  key: null
  icon: null
  matchingURLRegex: null
  anchorClassBlackList: null
  resourceIDRegex: null
  apiURL: null
  requestsPerSecond: null

  promiseForScoreRequest: (requestURL, success, failure) ->

  calculateScoreFromResponseData: (data) ->

  #### Abstract ########################################################

  constructor: ->
    @fetchScoreForURL = _.rateLimit(@fetchScoreForURL, 100)

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingURLRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  isAnchorBlackListed: (anchor) ->
    _.find(@anchorClassBlackList, (blackListedClass) -> anchor.hasClass(blackListedClass))

  fetchScoreForURL: (url, success, failure) ->
    resourceID = @_getResourceIDFromURL(url)
    requestURL = _.string.sprintf(@apiURL, resourceID)

    @promiseForScoreRequest(requestURL)
      .done((data) => success(@calculateScoreFromResponseData(data)))
      .fail(failure)

  _getResourceIDFromURL: (url) ->
    url.match(@resourceIDRegex)