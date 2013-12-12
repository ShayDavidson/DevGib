(function() {
  window.DevGib = {
    Sites: {}
  };

  $(document).ready(function() {
    var anchors, filtered_anchors, matchingAnchors, sites;
    sites = [new DevGib.Sites.Stackoverflow(), new DevGib.Sites.Github()];
    anchors = $(document).find('a');
    matchingAnchors = [];
    return filtered_anchors = _.filter(anchors, function(anchor) {
      var site, url;
      anchor = $(anchor);
      url = anchor.attr('href');
      site = _.find(sites, function(site) {
        return site.isURLMatching(url);
      });
      if (site) {
        return matchingAnchors.push({
          anchor: anchor,
          site: site
        });
      }
    });
  });

}).call(this);
