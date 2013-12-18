(function() {
  DevGib.Sites.AbstractSiteModel = (function() {
    function AbstractSiteModel() {}

    AbstractSiteModel.prototype.key = null;

    AbstractSiteModel.prototype.icon = null;

    AbstractSiteModel.prototype.matchingRegex = null;

    AbstractSiteModel.prototype.isURLMatching = function(url) {
      var matchingURL, noHashInURL, noQueryInURL;
      if (!url) {
        return false;
      }
      matchingURL = this.matchingRegex.test(url);
      noQueryInURL = url.indexOf('?') === -1;
      noHashInURL = url.indexOf('#') === -1;
      return matchingURL && noQueryInURL && noHashInURL;
    };

    AbstractSiteModel.prototype.fetchScoreForURL = function(url, success, failure) {
      return setTimeout((function() {
        return success(Math.floor(Math.random() * 10) + 1);
      }), Math.floor(Math.random() * 2000 + 500));
    };

    return AbstractSiteModel;

  })();

}).call(this);
