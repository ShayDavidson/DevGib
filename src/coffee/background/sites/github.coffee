class DevGib.Background.Sites.Github extends DevGib.Background.AbstractSiteModel

  #### Site Model Interface #####################################################

  key:                  'github'
  icon:                 '&#xf113;'
  urlRegex:             /^https:\/\/github.com\/((?!sessions|settings|account|trending|explore|site|organizations|showcase|dashboard|stars|blog|repositories)[\w\-\.]+)\/((?!following|followers)[\w\-\.]+)\/?$/
  classBlackList:       ['sunken-menu-item', 'up-tree', 'repo-root']
  apiURL:               'https://api.github.com/repos/%s'
  idRegex:              /com\/([\w\-\.]+\/[\w\-\.]+)/
  accessTokenKey:       'access_token'

  #### Heuristics ###############################################################

  calculateScoreFromResponseData: (data) ->
    watchers = data['watchers_count']
    stars = data['stargazers_count']

    Math.log(Math.max(1, watchers)) + Math.log(Math.max(1, stars))