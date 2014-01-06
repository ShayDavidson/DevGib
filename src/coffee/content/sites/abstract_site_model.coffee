class DevGib.Sites.AbstractSiteModel

  #### Interface ################################################################

  #
  key: null

  #
  icon: null

  #
  matchingURLRegex: null

  #
  anchorClassBlackList: []

  #
  requestsPerSecond: 10

  #
  fetchScoreForURL: (url, success, failure) ->
    throw 'Error: `fetchScoreForURL` method must be implemented.'

  #### Common Implementation ####################################################

  constructor: ->
    throw 'Error: `key` property must be set.'              unless @key
    throw 'Error: `icon` property must be set.'             unless @icon
    throw 'Error: `matchingURLRegex` property must be set.' unless @matchingURLRegex

    @fetchScoreForURL = _.rateLimit(@fetchScoreForURL, 1000 / @requestsPerSecond)

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingURLRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  isAnchorBlackListed: (anchor) ->
    _.find(@anchorClassBlackList, (blackListedClass) -> anchor.hasClass(blackListedClass))