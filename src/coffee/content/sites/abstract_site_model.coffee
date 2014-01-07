class DevGib.Sites.AbstractSiteModel

  #### Interface ################################################################

  #### Required

  # A string id representing the site.
  key: null

  # The HTML hexadecimal representation of the icon that appears for the site (from the FontAwesome font).
  icon: null

  # A regex that matches the URLs of anchors on which the score icon should appear.
  matchingURLRegex: null

  # This method receives a URL to query, a success callback and a failure callback.
  # For each site, it has to call any corresponding external APIs, calculate the score,
  # and call the `success` callback with the score as an argument.
  # If the fetch fails somehow, it should call the `failure` callback.
  fetchScoreForURL: (url, success, failure) ->
    throw 'Error: `fetchScoreForURL` method must be implemented.'

  #### Optional

  # An array of HTML classes that prevent an icon from appearing on anchors with them.
  # This is used for cases when an anchor is matching the URL regex but the added icon looks out of place.
  anchorClassBlackList: []

  # Defines how many `fetchScoreForURL` calls be made in a second (in order to rate limit the calls to external APIs).
  requestsPerSecond: 10

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