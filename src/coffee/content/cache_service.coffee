class DevGib.Content.CacheService

  #### Constants ################################################################

  @EXPIRATION_PERIOD_IN_DAYS: 7

  #### Implementation ###########################################################

  @getCachedScoreForURL: (url, success, failure) ->
    chrome.storage.local.get(url, (val) =>
      if _.isEmpty(val) || @_isCachedResultExpired(val[url])
        failure()
      else
        success(val[url].score)
    )

  @cacheScoreForURL: (url, score) ->
    cachedResult = {}
    cachedResult[url] = @_buildCachedResult(score)
    chrome.storage.local.set(cachedResult)

  @_expirationDateFromNow: ->
    new Date().getTime() + (@EXPIRATION_PERIOD_IN_DAYS * 24 * 60 * 60)

  @_buildCachedResult: (score) ->
    score: score
    expiresIn: @_expirationDateFromNow()

  @_isCachedResultExpired: (cachedResult) ->
    cachedResult.expiresIn <= new Date().getTime()



