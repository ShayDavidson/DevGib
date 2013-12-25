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
    @throttleService = new DevGib.ThrottleService(@requestsPerSecond)

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

    @throttleService.throttleRequest( =>
      @promiseForScoreRequest(requestURL)
        .done((data) => success(@getScoreFromAnswersData(data)))
        .fail(failure)
    )

  _getResourceIDFromURL: (url) ->
    url.match(@resourceIDRegex)