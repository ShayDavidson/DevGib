class window.AbstractSite

  key: null
  host: null
  matchingRegex: null

  isURLMatching: (url) ->
    (window.location.hostname.indexOf(@host) == 0) && (@matchingRegex.test(url))

