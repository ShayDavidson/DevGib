class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  #### Site Model Interface #####################################################

  key: 'github'
  icon: '&#xf113;'
  matchingURLRegex: /^https:\/\/github.com\/((?!settings|account|explore|site|organizations|dashboard|blog|repositories)[\w\-\.]+)\/[\w\-\.]+\/?$/
  anchorClassBlackList: ['sunken-menu-item']
  requestsPerSecond: 10

  #### Implementation ###########################################################

  fetchScoreForURL: (url, success, failure) ->