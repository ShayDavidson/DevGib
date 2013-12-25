class DevGib.ThrottleService

  constructor: (@requestsPerSecond) ->
    @currentActiveRequest = 0

  throttleRequest: (requestFunction) ->
