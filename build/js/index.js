(function() {
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
      return $(document).find('a');
    };

    Extension.prototype._getTargetSites = function() {
      return [new DevGib.Sites.Stackoverflow(), new DevGib.Sites.Github()];
    };

    return Extension;

  })();

  $(document).ready(function() {
    var extension;
    extension = new DevGib.Extension();
    return setTimeout((function() {
      return extension.run();
    }), 0);
  });

}).call(this);
