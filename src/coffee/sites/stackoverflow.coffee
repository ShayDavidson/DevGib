class DevGib.Sites.Stackoverflow extends DevGib.Sites.AbstractSiteModel

  key: 'stackoverflow'
  icon: '&#xf16c;'
  matchingURLRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/
  resourceIDRegex: /\d+/

#  fetchScoreForURL: (url, success, failure) -> # override by subclass.
#    resourceID = @_getResourceIDFromURL(url)
#    $.get()
#    setTimeout((-> success(Math.floor(Math.random()*10) + 1)), Math.floor(Math.random()*2000 + 500))






#    https://api.stackexchange.com/2.1/questions/2078915/answers?site=stackoverflow&order=desc&sort=activity&filter=default
