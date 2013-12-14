(function() {
  DevGib.Sites.AbstractSiteModel = (function() {
    function AbstractSiteModel() {}

    AbstractSiteModel.prototype.key = null;

    AbstractSiteModel.prototype.icon = null;

    AbstractSiteModel.prototype.host = null;

    AbstractSiteModel.prototype.matchingRegex = null;

    AbstractSiteModel.prototype.isURLMatching = function(url) {
      var matchingURL, noHashInURL, noQueryInURL;
      if (!url) {
        return false;
      }
      matchingURL = this.matchingRegex.test(this._sanitizedURL(url));
      noQueryInURL = url.indexOf('?') === -1;
      noHashInURL = url.indexOf('#') === -1;
      return matchingURL && noQueryInURL && noHashInURL;
    };

    AbstractSiteModel.prototype._sanitizedURL = function(url) {
      if (url.indexOf('http') < 0) {
        return "" + window.location.protocol + "//" + window.location.hostname + url;
      } else {
        return url;
      }
    };

    return AbstractSiteModel;

  })();

}).call(this);
