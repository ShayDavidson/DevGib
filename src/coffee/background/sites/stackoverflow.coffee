class DevGib.Background.Sites.Stackoverflow extends DevGib.Background.AbstractSiteModel

  #### Site Model Interface #####################################################

  key:      'stackoverflow'
  icon:     '&#xf18d;'
  urlRegex: /^http:\/\/stackoverflow.com\/questions\/\d+/
  apiURL:   'https://api.stackexchange.com/2.1/questions/%s/answers?site=stackoverflow&order=desc&sort=activity&filter=default'
  idRegex:  /\d+/

  #### Heuristics ###############################################################

  @BASE_SCORE:   2
  @ANSWER_BONUS: 5

  calculateScoreFromResponseData: (data) ->
    allAnswers = data['items']
    acceptedAnswer = _.find(allAnswers, (answer) -> answer['is_accepted'])
    accumulatedScore = _.reduce(allAnswers, ((sum, answer) -> sum + answer['score']), 0)
    sanitiziedScore = Math.max(accumulatedScore, 0)

    startingScore = @constructor.BASE_SCORE
    startingScore += @constructor.ANSWER_BONUS if acceptedAnswer
    startingScore += Math.log(sanitiziedScore) if sanitiziedScore > 0

    startingScore