class DevGib.Sites.Stackoverflow extends DevGib.Sites.AbstractSiteModel

  key: 'stackoverflow'
  icon: '&#xf16c;'
  matchingRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/

  fetchScoreForURL: (url) -> # override by subclass.
#    https://api.stackexchange.com/2.1/questions/2078915/answers?site=stackoverflow&order=desc&sort=activity&filter=default
