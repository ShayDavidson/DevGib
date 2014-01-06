class DevGib.CacheService

  #### Constants ################################################################

  @EXPIRATION_PERIOD_IN_DAYS: 7
  @SCORE_KEY: 'score'
  @EXPIRATION_KEY: 'expiresIn'

  #### Implementation ###########################################################

  @getCachedScoreForURL: (url) ->
    deferred = $.Deferred()
    chrome.storage.local.get(url, (val) =>
      if _.isEmpty(val) || @_isCachedResultExpired(val)
        deferred.reject()
      else
        deferred.resolve(val[url][@SCORE_KEY])
    )
    deferred.promise()

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



