class DevGib.Sites.AbstractSiteModel

  key: null
  icon: null
  matchingRegex: null

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingRegex.test(url)
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  fetchScoreForURL: (url, success, failure) -> # override by subclass.

  _onFetchSuccess: (data) -> # override by subclass.

  _onFetchFailure: ->





