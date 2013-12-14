class DevGib.Sites.AbstractSiteModel

  key: null
  icon: null
  host: null
  matchingRegex: null

  isURLMatching: (url) ->
    return false unless url

    matchingURL  = @matchingRegex.test(@_sanitizedURL(url))
    noQueryInURL = url.indexOf('?') == -1
    noHashInURL  = url.indexOf('#') == -1

    matchingURL && noQueryInURL && noHashInURL

  _sanitizedURL: (url) ->
    if url.indexOf('http') < 0
      "#{window.location.protocol}//#{window.location.hostname}#{url}"
    else
      url


