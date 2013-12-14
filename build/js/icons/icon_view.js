(function() {
  DevGib.Icons.IconView = (function() {
    IconView.prototype.DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';

    IconView.prototype.DEVGIB_SCORE_CLASS_PREFIX = 'score';

    IconView.prototype.anchorEl = null;

    IconView.prototype.spanEl = null;

    IconView.prototype.siteModel = null;

    function IconView(anchorEl, siteModel) {
      var score;
      this.anchorEl = anchorEl;
      this.siteModel = siteModel;
      score = Math.floor(Math.random() * 10) + 1;
      this.spanEl = $("<span>" + siteModel.icon + "&nbsp;</span>");
      this.spanEl.addClass(this.DEVGIB_SCORE_ICON_CLASS);
      this.spanEl.addClass(this.siteModel.key);
      this.spanEl.addClass("" + this.DEVGIB_SCORE_CLASS_PREFIX + "-" + score);
      this.spanEl.attr('title', "DevGib - " + this.siteModel.key + " score: " + score);
    }

    IconView.prototype.show = function() {
      return this.anchorEl.prepend(this.spanEl);
    };

    return IconView;

  })();

}).call(this);
