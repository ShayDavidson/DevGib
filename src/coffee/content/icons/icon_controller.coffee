class DevGib.Content.Icons.IconController

  #### Constants ################################################################

  @MAX_SCORE: 10

  #### Implementation ###########################################################

  siteModel: null
  iconView: null
  url: null

  constructor: (anchorEl, @url, @siteModel) ->
    @iconView = new DevGib.Content.Icons.IconView(anchorEl, siteModel)
    _.bindAll(@, '_showAndCacheScore', '_showScore', '_showError', '_fetchScore')

  show: ->
    @iconView.attach().showSpinner()
    DevGib.CacheService.getCachedScoreForURL(@url, @_showScore, @_fetchScore)

  _showScore: (score) ->
    @iconView.showScore(@_sanitizedScore(score))

  _showAndCacheScore: (score) ->
    DevGib.CacheService.cacheScoreForURL(@url, score)
    @_showScore(score)

  _fetchScore: ->
    @siteModel.fetchScoreForURL(@url, @_showAndCacheScore, @_showError)

  _showError: ->
    @iconView.showError()

  _sanitizedScore: (score) ->
    Math.round(Math.min(@constructor.MAX_SCORE, score))