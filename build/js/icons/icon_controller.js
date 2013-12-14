(function() {
  DevGib.Icons.IconController = (function() {
    IconController.prototype.DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';

    IconController.prototype.DEVGIB_SCORE_CLASS = 'score';

    IconController.prototype.anchorEl = null;

    IconController.prototype.spanEl = null;

    IconController.prototype.site = null;

    function IconController(anchorEl, site) {
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

    return IconController;

  })();

}).call(this);
