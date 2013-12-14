(function() {
  window.DevGib = {
    Icons: {},
    Sites: {}
  };

  $(document).ready(function() {
    var anchors, sites;
    sites = [new DevGib.Sites.Stackoverflow(), new DevGib.Sites.Github()];
    anchors = $(document).find('a');
    return _.each(anchors, function(anchor) {
      var dataHref, href, site;
      anchor = $(anchor);
      href = anchor.attr('href');
      dataHref = anchor.attr('data-href');
      site = _.find(sites, function(site) {
        return site.isURLMatching(href) || site.isURLMatching(dataHref);
      });
      if (site) {
        return new DevGib.Icons.IconController(anchor, site);
      }
    });
  });

}).call(this);
