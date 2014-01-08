class DevGib.Sites.Github extends DevGib.Sites.AbstractSiteModel

  #### Site Model Interface #####################################################

  key:            'github'
  icon:           '&#xf113;'
  urlRegex:       /^https:\/\/github.com\/((?!settings|account|trending|explore|site|organizations|dashboard|blog|repositories)[\w\-\.]+)\/[\w\-\.]+\/?$/
  classBlackList: ['sunken-menu-item']
  apiURL:         'https://api.github.com/repos/%s?access_token=620de2f0235357839496e87d4a84ab274b7ea523'
  idRegex:        /com\/([\w\-\.]+\/[\w\-\.]+)/

  #### Heuristics ###############################################################

  calculateScoreFromResponseData: (data) ->
    forks = data['forks']
    watchers = data['watchers']

    Math.log(Math.max(1, forks)) + Math.log(Math.max(1, watchers))