(function() {
  DevGib.Sites.AbstractSiteModel = (function() {
    function AbstractSiteModel() {}

    AbstractSiteModel.prototype.key = null;

    AbstractSiteModel.prototype.icon = null;

    AbstractSiteModel.prototype.matchingURLRegex = null;

    AbstractSiteModel.prototype.resourceIDRegex = null;

    AbstractSiteModel.prototype.fetchScoreForURL = function(url, success, failure) {};

    AbstractSiteModel.prototype.isURLMatching = function(url) {
      var matchingURL, noHashInURL, noQueryInURL;
      if (!url) {
        return false;
      }
      matchingURL = this.matchingURLRegex.test(url);
      noQueryInURL = url.indexOf('?') === -1;
      noHashInURL = url.indexOf('#') === -1;
      return matchingURL && noQueryInURL && noHashInURL;
    };

    AbstractSiteModel.prototype.getResourceIDFromURL = function(url) {
      return url.match(this.resourceIDRegex);
    };

    return AbstractSiteModel;

  })();

}).call(this);
