(function() {
  window.DevGib = {
    Sites: {}
  };

  $(document).ready(function() {
    var DEVGIB_SCORE_CLASS, DEVGIB_SCORE_ICON_CLASS, anchors, sites, targets;
    DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';
    DEVGIB_SCORE_CLASS = 'score';
    sites = [new DevGib.Sites.Stackoverflow(), new DevGib.Sites.Github()];
    anchors = $(document).find('a');
    targets = [];
    _.each(anchors, function(anchor) {
      var dataHref, href, site;
      anchor = $(anchor);
      href = anchor.attr('href');
      dataHref = anchor.attr('data-href');
      site = _.find(sites, function(site) {
        return site.isURLMatching(href) || site.isURLMatching(dataHref);
      });
      if (site) {
        return targets.push({
          anchor: anchor,
          site: site
        });
      }
    });
    return _.each(targets, function(target) {
      var score, scoreElement;
      score = Math.floor(Math.random() * 10) + 1;
      scoreElement = $('<span>☢&nbsp;</span>');
      scoreElement.addClass(DEVGIB_SCORE_ICON_CLASS);
      scoreElement.addClass(target.site.key);
      scoreElement.addClass("" + DEVGIB_SCORE_CLASS + "-" + score);
      scoreElement.attr('title', "DevGib - " + target.site.key + " score: " + score);
      return target.anchor.prepend(scoreElement);
    });
  });

}).call(this);
