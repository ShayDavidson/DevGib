class DevGib.Sites.Stackoverflow extends DevGib.Sites.AbstractSiteModel

  #### Site Model Interface #####################################################

  key: 'stackoverflow'
  icon: '&#xf18d;'
  matchingURLRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/

  #### Implementation ###########################################################

  @RESOURCE_ID_REGEX: /\d+/
  @API_URL: 'https://api.stackexchange.com/2.1/questions/%s/answers?site=stackoverflow&order=desc&sort=activity&filter=default'

  @BASE_SCORE: 2
  @ANSWER_BONUS: 5

  fetchScoreForURL: (url, success, failure) ->
    resourceID = @_getResourceIDFromURL(url)
    requestURL = _.string.sprintf(@constructor.API_URL, resourceID)

    $.get(requestURL)
      .done((data) => success(@calculateScoreFromResponseData(data)))
      .fail(failure)

  calculateScoreFromResponseData: (data) ->
    allAnswers = data['items']
    acceptedAnswer = _.find(allAnswers, (answer) -> answer['is_accepted'])
    accumulatedScore = _.reduce(allAnswers, ((sum, answer) -> sum + answer['score']), 0)
    sanitiziedScore = Math.max(accumulatedScore, 0)

    startingScore = @constructor.BASE_SCORE
    startingScore += @constructor.ANSWER_BONUS if acceptedAnswer
    startingScore += Math.log(sanitiziedScore) if sanitiziedScore > 0

    startingScore

  _getResourceIDFromURL: (url) ->
    url.match(@constructor.RESOURCE_ID_REGEX)