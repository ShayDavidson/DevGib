class DevGib.Sites.AbstractSiteModel

  @THROTTLE_LIMIT: 100

  #### Interface #######################################################

  key: null
  icon: null
  matchingURLRegex: null
  anchorClassBlackList: null
  requestsPerSecond: null

  fetchScoreForURL: (url) ->

  #### Abstract ########################################################

  constructor: ->
    @fetchScoreForURL = _.rateLimit(@fetchScoreForURL, 1000 / @requestsPerSecond)

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingURLRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  isAnchorBlackListed: (anchor) ->
    _.find(@anchorClassBlackList, (blackListedClass) -> anchor.hasClass(blackListedClass))