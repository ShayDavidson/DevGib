(function() {
  DevGib.Sites.AbstractSite = (function() {
    function AbstractSite() {}

    AbstractSite.prototype.key = null;

    AbstractSite.prototype.host = null;

    AbstractSite.prototype.matchingRegex = null;

    AbstractSite.prototype.isURLMatching = function(url) {
      return (window.location.hostname.indexOf(this.host) === 0) && (this.matchingRegex.test(url));
    };

    return AbstractSite;

  })();

}).call(this);
