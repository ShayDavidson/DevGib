(function() {
  var run, runNodeInserted;

  window.DevGib = {
    Icons: {},
    Sites: {}
  };

  DevGib.Extension = (function() {
    function Extension() {}

    Extension.prototype.run = function() {
      var anchors, sites;
      sites = this._getTargetSites();
      anchors = this._getPageAnchors();
      return _.each(anchors, function(anchor) {
        var href, icon, site;
        anchor = $(anchor);
        anchor.attr('data-devgib', 'tagged');
        href = anchor.attr('href');
        if (site = _.find(sites, function(site) {
          return site.isURLMatching(href);
        })) {
          icon = new DevGib.Icons.IconView(anchor, site);
          return icon.show();
        }
      });
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
