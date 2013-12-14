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
        var dataHref, href, icon, site;
        anchor = $(anchor);
        href = anchor.attr('href');
        dataHref = anchor.attr('data-href');
        site = _.find(sites, function(site) {
          return site.isURLMatching(href) || site.isURLMatching(dataHref);
        });
        if (site) {
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
    return extension.run();
  });

}).call(this);
