class DevGib.Sites.Stackoverflow extends DevGib.Sites.AbstractSiteModel

  key: 'stackoverflow'
  icon: '&#xf16c;'
  matchingURLRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/
  anchorBlackList: []
  resourceIDRegex: /\d+/
  apiURL: 'https://api.stackexchange.com/2.1/questions/%s/answers?site=stackoverflow&order=desc&sort=activity&filter=default'
  requestsPerSecond: 5

  promiseForScoreRequest: (requestURL) -> # override by subclass.
    $.get(requestURL)

  calculateScoreFromResponseData: (data) ->
    allAnswers = data['items']
    acceptedAnswer = _.find(allAnswers, (answer) -> answer['is_accepted'])
    accumulatedScore = _.reduce(allAnswers, ((sum, answer) -> sum + answer['score']), 0)
    sanitiziedScore = Math.max(accumulatedScore, 0)

    startingScore = 10
    startingScore -= 4 unless acceptedAnswer
    startingScore += Math.log(sanitiziedScore)

    startingScore

