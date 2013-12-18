(function() {
  var run, runNodeInserted;

  DevGib.Extension = (function() {
    function Extension() {}

    Extension.prototype.run = function() {
      var anchors, sites,
        _this = this;
      sites = this._getTargetSites();
      anchors = this._getPageAnchors();
      return _.each(anchors, function(anchor) {
        var icon, sanitizedURL, site, url;
        anchor = $(anchor);
        anchor.attr('data-devgib', 'tagged');
        url = anchor.attr('href');
        if (!url) {
          return;
        }
        sanitizedURL = _this._sanitizedURL(url);
        if (site = _.find(sites, function(site) {
          return site.isURLMatching(sanitizedURL);
        })) {
          icon = new DevGib.Icons.IconController(anchor, sanitizedURL, site);
          return icon.show();
        }
      });
    };

    Extension.prototype._sanitizedURL = function(url) {
      if (url.indexOf('http') < 0) {
        return "" + window.location.protocol + "//" + window.location.hostname + url;
      } else {
        return url;
      }
    };

    Extension.prototype._getPageAnchors = function() {
      return $(document).find("a:not([data-devgib='tagged'])");
    };

    Extension.prototype._getTargetSites = function() {
      return [new DevGib.Sites.Stackoverflow(), new DevGib.Sites.Github()];
    };

    Extension.sharedInstance = function() {
      if (!this._instance) {
        this._instance = new DevGib.Extension();
      }
      return this._instance;
    };

    return Extension;

  })();

  /* Running*/


  run = function() {
    return DevGib.Extension.sharedInstance().run();
  };

  runNodeInserted = function() {
    $(document).unbind('DOMNodeInserted');
    run();
    return $(document).bind('DOMNodeInserted', runNodeInserted);
  };

  $(document).ready(run);

  $(document).bind('DOMNodeInserted', runNodeInserted);

}).call(this);
