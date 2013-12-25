class DevGib.Icons.IconController

  @MAX_SCORE: 10

  siteModel: null
  iconView: null
  url: null

  constructor: (anchorEl, @url, @siteModel) ->
    @iconView = new DevGib.Icons.IconView(anchorEl, siteModel)
    _.bindAll(@, '_onFetchScoreSuccess', '_onFetchScoreFailure')

  show: ->
    @iconView.attach()

    cachedScore = DevGib.CacheService.cachedScoreForURL(@url)
    if cachedScore == DevGib.CacheService.NOT_CACHED
      @iconView.showSpinner()
      @siteModel.fetchScoreForURL(@url, @_onFetchScoreSuccess, @_onFetchScoreFailure)
    else
      @iconView.showScore(@_sanitizedScore(cachedScore))

  _onFetchScoreSuccess: (score) ->
    @iconView.showScore(@_sanitizedScore(score))

  _onFetchScoreFailure: ->
    @iconView.showError()

  _sanitizedScore: (score) ->
    Math.round(Math.min(@constructor.MAX_SCORE, score))