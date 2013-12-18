(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DevGib.Sites.Stackoverflow = (function(_super) {
    __extends(Stackoverflow, _super);

    function Stackoverflow() {
      _ref = Stackoverflow.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Stackoverflow.prototype.key = 'stackoverflow';

    Stackoverflow.prototype.icon = '&#xf16c;';

    Stackoverflow.prototype.matchingURLRegex = /^http:\/\/stackoverflow.com\/questions\/\d+/;

    Stackoverflow.prototype.resourceIDRegex = /\d+/;

    Stackoverflow.prototype.apiURL = 'https://api.stackexchange.com/2.1/questions/%s/answers?site=stackoverflow&order=desc&sort=activity&filter=default';

    Stackoverflow.prototype.fetchScoreForURL = function(url, success, failure) {
      var requestURL, resourceID,
        _this = this;
      resourceID = this.getResourceIDFromURL(url);
      requestURL = _.string.sprintf(this.apiURL, resourceID);
      return $.get(requestURL).done(function(data) {
        return success(_this._getScoreFromAnswersData(data));
      }).fail(failure);
    };

    Stackoverflow.prototype.maxScore = 10;

    Stackoverflow.prototype.noAnswerPenalty = 4;

    Stackoverflow.prototype._getScoreFromAnswersData = function(data) {
      var acceptedAnswer, accumulatedScore, allAnswers, sanitiziedScore, startingScore;
      allAnswers = data['items'];
      acceptedAnswer = _.find(allAnswers, function(answer) {
        return answer['is_accepted'];
      });
      accumulatedScore = _.reduce(allAnswers, (function(sum, answer) {
        return sum + answer['score'];
      }), 0);
      sanitiziedScore = Math.max(accumulatedScore, 0);
      startingScore = this.maxScore;
      if (!acceptedAnswer) {
        startingScore -= this.noAnswerPenalty;
      }
      startingScore += Math.log(sanitiziedScore);
      return startingScore;
    };

    return Stackoverflow;

  })(DevGib.Sites.AbstractSiteModel);

}).call(this);
