class DevGib.Sites.AbstractSiteModel

  key: null
  icon: null
  host: null
  matchingRegex: null

  isURLMatching: (url) ->
    return false unless url

    matchingHost = window.location.hostname.indexOf(@host) == 0
    matchingPath = @matchingRegex.test(url)
    noQuery      = url.indexOf('?') == -1
    noHash       = url.indexOf('#') == -1

    matchingHost && matchingPath && noQuery && noHash

