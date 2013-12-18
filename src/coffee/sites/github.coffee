class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  key: 'github'
  icon: '&#xf113;'
  matchingURLRegex: /^https:\/\/github.com\/((?!settings|account|explore|site|organizations|dashboard|blog|repositories)[\w\-\.]+)\/[\w\-\.]+\/?$/
  anchorClassBlackList: ['sunken-menu-item']
  resourceIDRegex: null