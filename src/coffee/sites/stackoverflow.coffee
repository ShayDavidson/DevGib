class DevGib.Sites.Stackoverflow extends DevGib.Sites.AbstractSiteModel

  key: 'stackoverflow'
  icon: '&#xf16c;'
  matchingURLRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/
  resourceIDRegex: /\d+/
  apiURL: 'https://api.stackexchange.com/2.1/questions/%s/answers?site=stackoverflow&order=desc&sort=activity&filter=default'

  fetchScoreForURL: (url, success, failure) -> # override by subclass.
    resourceID = @getResourceIDFromURL(url)
    requestURL = _.string.sprintf(@apiURL, resourceID)
    $.get(requestURL)
      .done((data) =>
        success(@_getScoreFromAnswersData(data))
      )
      .fail(failure)

  #### Heuristics ######################################################

  maxScore: 10
  noAnswerPenalty: 4

  _getScoreFromAnswersData: (data) ->
    allAnswers = data['items']
    acceptedAnswer = _.find(allAnswers, (answer) -> answer['is_accepted'])
    accumulatedScore = _.reduce(allAnswers, ((sum, answer) -> sum + answer['score']), 0)
    sanitiziedScore = Math.max(accumulatedScore, 0)

    startingScore = @maxScore
    startingScore -= @noAnswerPenalty unless acceptedAnswer
    startingScore += Math.log(sanitiziedScore)

    startingScore

