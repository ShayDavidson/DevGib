class DevGib.Sites.AbstractSiteModel

  #### Interface ################################################################

  #### Required -----------------------------------------------------------------

  # A string id representing the site.
  key: null

  # The HTML hexadecimal representation of the icon that appears for the site (from the FontAwesome font).
  icon: null

  # A regex that matches the URLs of anchors on which the score icon should appear.
  urlRegex: null

  # The format of the external API URL. DevGib performs a GET request for this URL.
  # It has to contain a `%s` substring in the place where the queried resourced ID should be placed.
  apiURL: null

  # A regex that extracts the resource ID (which will be inserted into the API query) from the URL of the site.
  idRegex: null

  # This method calculates the URL score based on the response from the API call.
  calculateScoreFromResponseData: (data) ->
    throw 'Error: `calculateScoreFromResponseData` must be implemented and return a score value.'

  #### Optional -----------------------------------------------------------------

  # An array of HTML classes that prevent an icon from appearing on anchors with them.
  # This is used for cases when an anchor is matching the URL regex but the added icon looks out of place.
  classBlackList: []

  # Defines how many `fetchScoreForURL` calls be made in a second (in order to rate limit the calls to external APIs).
  requestsPerSecond: 10

  #### Common Implementation ####################################################

  constructor: ->
    throw 'Error: `key` property must be set.'      unless @key
    throw 'Error: `icon` property must be set.'     unless @icon
    throw 'Error: `urlRegex` property must be set.' unless @urlRegex
    throw 'Error: `apiURL` property must be set.'   unless @apiURL
    throw 'Error: `idRegex` property must be set.'  unless @idRegex

    @fetchScoreForURL = _.rateLimit(@fetchScoreForURL, 1000 / @requestsPerSecond)

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @urlRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  isAnchorBlackListed: (anchor) ->
    _.find(@classBlackList, (blackListedClass) -> anchor.hasClass(blackListedClass))

  fetchScoreForURL: (url, success, failure) ->
    resourceID = @_getResourceIDFromURL(url)
    requestURL = _.string.sprintf(@apiURL, resourceID)

    $.get(requestURL)
      .done((data) => success(@calculateScoreFromResponseData(data)))
      .fail(failure)

  _getResourceIDFromURL: (url) ->
    _.last(url.match(@idRegex))