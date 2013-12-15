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

    AbstractSiteModel.prototype.fetchScore = function() {};

    return AbstractSiteModel;

  })();

}).call(this);
