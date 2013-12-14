(function() {
  DevGib.Icons.IconView = (function() {
    IconView.prototype.DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';

    IconView.prototype.DEVGIB_SCORE_CLASS = 'score';

    IconView.prototype.anchorEl = null;

    IconView.prototype.spanEl = null;

    IconView.prototype.site = null;

    function IconView(anchorEl) {
      this.spanEl = $("<span>&nbsp;</span>");
      this.spanEl.addClass(this.DEVGIB_SCORE_ICON_CLASS);
      this.spanEl.addClass(this.site.key);
      this.spanEl.addClass("" + this.DEVGIB_SCORE_CLASS + "-" + score);
      this.spanEl.attr('title', "DevGib - " + this.site.key + " score: " + score);
      anchorEl.prepend(this.spanEl);
    }

    return IconView;

  })();

}).call(this);
