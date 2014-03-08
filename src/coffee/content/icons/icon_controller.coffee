class DevGib.Content.Icons.IconController

  #### Constants ################################################################

  @MAX_SCORE: 10

  #### Implementation ###########################################################

  key: null
  iconView: null
  url: null

  constructor: (anchorEl, @url, siteData) ->
    @key = siteData.key
    @iconView = new DevGib.Content.Icons.IconView(anchorEl, siteData.key, siteData.icon)
    _.bindAll(@, '_showAndCacheScore', '_showScore', '_showError', '_fetchScore')

  show: ->
    @iconView.attach().showSpinner()
    DevGib.Content.CacheService.getCachedScoreForURL(@url, @_showScore, @_fetchScore)

  _showScore: (score) ->
    @iconView.showScore(@_sanitizedScore(score))

  _showAndCacheScore: (score) ->
    DevGib.Content.CacheService.cacheScoreForURL(@url, score)
    @_showScore(score)

  _fetchScore: ->
    message = {type: 'score', data: {key: @key, url: @url}}
    chrome.runtime.sendMessage(message, (response) =>
      console.log(response)
      if response.error
        @_showError()
      else
        @_showAndCacheScore(response.score)
    )

  _showError: ->
    @iconView.showError()

  _sanitizedScore: (score) ->
    Math.round(Math.min(@constructor.MAX_SCORE, score))