(function() {
  DevGib.Sites.AbstractSiteModel = (function() {
    function AbstractSiteModel() {}

    AbstractSiteModel.prototype.key = null;

    AbstractSiteModel.prototype.icon = null;

    AbstractSiteModel.prototype.host = null;

    AbstractSiteModel.prototype.matchingRegex = null;

    AbstractSiteModel.prototype.isURLMatching = function(url) {
      var matchingHost, matchingPath, noHash, noQuery;
      if (!url) {
        return false;
      }
      matchingHost = window.location.hostname.indexOf(this.host) === 0;
      matchingPath = this.matchingRegex.test(url);
      noQuery = url.indexOf('?') === -1;
      noHash = url.indexOf('#') === -1;
      console.log(url, matchingHost && matchingPath && noQuery && noHash);
      return matchingHost && matchingPath && noQuery && noHash;
    };

    return AbstractSiteModel;

  })();

}).call(this);
