(function() {
  DevGib.Target = (function() {
    Target.prototype.DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';

    Target.prototype.DEVGIB_SCORE_CLASS = 'score';

    Target.prototype.anchorEl = null;

    Target.prototype.spanEl = null;

    Target.prototype.site = null;

    function Target(anchorEl, site) {
      var score;
      this.site = site;
      score = 1;
      this.spanEl = $("<span>" + this.site.icon + "&nbsp;</span>");
      this.spanEl.addClass(this.DEVGIB_SCORE_ICON_CLASS);
      this.spanEl.addClass(this.site.key);
      this.spanEl.addClass("" + this.DEVGIB_SCORE_CLASS + "-" + score);
      this.spanEl.attr('title', "DevGib - " + this.site.key + " score: " + score);
      anchorEl.prepend(this.spanEl);
    }

    return Target;

  })();

}).call(this);
