class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  #### Site Model Interface #####################################################

  key:            'github'
  icon:           '&#xf113;'
  urlRegex:       /^https:\/\/github.com\/((?!settings|account|trending|explore|site|organizations|dashboard|stars|blog|repositories)[\w\-\.]+)\/((?!following|followers)[\w\-\.]+)\/?$/
  classBlackList: ['sunken-menu-item']
  apiURL:         'https://api.github.com/repos/%s'
  idRegex:        /com\/([\w\-\.]+\/[\w\-\.]+)/
  accessTokenKey: 'access_token'

  #### Heuristics ###############################################################

  calculateScoreFromResponseData: (data) ->
    forks = data['forks']
    watchers = data['watchers']

    Math.log(Math.max(1, forks)) + Math.log(Math.max(1, watchers))