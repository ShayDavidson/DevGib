class DevGib.CacheService

  @EXPIRATION_PERIOD_IN_DAYS: 7
  @SCORE_KEY: 'score'
  @EXPIRATION_KEY: 'expiresIn'
  @NOT_CACHED: -1

  @getCachedScoreForURL: (url, callback) ->
    chrome.storage.local.get(url, (val) =>
      if _.isEmpty(val) || @_isCachedResultExpired(val)
        callback(@NOT_CACHED)
      else
        callback(val[url][@SCORE_KEY]))


  @cacheScoreForURL: (url, score) ->
    cachedResult = {}
    cachedResult[url] = @_buildCachedResult(score)
    chrome.storage.local.set(cachedResult)

  @_expirationDateFromNow: ->
    new Date().setDate(new Date().getDate() + @EXPIRATION_PERIOD_IN_DAYS)

  @_buildCachedResult: (score) ->
    result = {}
    result[@SCORE_KEY]      = score
    result[@EXPIRATION_KEY] = @_expirationDateFromNow()
    result

  @_isCachedResultExpired: (cachedResult) ->
    cachedResult.expiration <= new Date()



