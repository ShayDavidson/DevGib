class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  #### Site Model Interface #####################################################

  key:            'github'
  icon:           '&#xf113;'
  urlRegex:       /^https:\/\/github.com\/((?!settings|account|explore|site|organizations|dashboard|blog|repositories)[\w\-\.]+)\/[\w\-\.]+\/?$/
  classBlackList: ['sunken-menu-item']
  apiURL:         'https://api.github.com/repos/%s'
  idRegex:        /\d+/

  #### Heuristics ###############################################################
