(function() {
  DevGib.Sites.AbstractSiteModel = (function() {
    function AbstractSiteModel() {}

    AbstractSiteModel.prototype.key = null;

    AbstractSiteModel.prototype.host = null;

    AbstractSiteModel.prototype.matchingRegex = null;

    AbstractSiteModel.prototype.isURLMatching = function(url) {
      return (window.location.hostname.indexOf(this.host) === 0) && (this.matchingRegex.test(url));
    };

    return AbstractSiteModel;

  })();

}).call(this);
