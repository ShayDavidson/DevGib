class DevGib.Content.CacheService

  #### Constants ################################################################

  @EXPIRATION_PERIOD_IN_DAYS: 7
  @SCORE_KEY: 'score'
  @EXPIRATION_KEY: 'expiresIn'

  #### Implementation ###########################################################

  @getCachedScoreForURL: (url, success, failure) ->
    chrome.storage.local.get(url, (val) =>
      if _.isEmpty(val) || @_isCachedResultExpired(val[url])
        failure()
      else
        success(val[url][@SCORE_KEY])
    )

  @cacheScoreForURL: (url, score) ->
    cachedResult = {}
    cachedResult[url] = @_buildCachedResult(score)
    chrome.storage.local.set(cachedResult)

  @_expirationDateFromNow: ->
    new Date().getTime() + (@EXPIRATION_PERIOD_IN_DAYS * 24 * 60 * 60)

  @_buildCachedResult: (score) ->
    result = {}
    result[@SCORE_KEY]      = score
    result[@EXPIRATION_KEY] = @_expirationDateFromNow()
    result

  @_isCachedResultExpired: (cachedResult) ->
    cachedResult[@EXPIRATION_KEY] <= new Date().getTime()



