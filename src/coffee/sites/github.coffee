class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  key: 'github'
  icon: '&#xf113;'
  matchingRegex: /^https:\/\/github.com\/((?!settings|account|explore|site|organizations|dashboard|blog|repositories)[\w\-\.]+)\/[\w\-\.]+\/?$/

  fetchScoreForURL: (url, success, failure) -> # override by subclass.