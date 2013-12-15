(function() {
  DevGib.Icons.IconView = (function() {
    IconView.SPINNER_ICON = '&#xf110;';

    IconView.PADDING_CHAR = '&nbsp;';

    IconView.SPINNING_CLASS = 'spinning';

    IconView.prototype.DEVGIB_SCORE_ICON_CLASS = 'devgib-score-icon';

    IconView.prototype.DEVGIB_SCORE_CLASS_PREFIX = 'score';

    IconView.prototype.anchorEl = null;

    IconView.prototype.spanEl = null;

    IconView.prototype.siteModel = null;

    function IconView(anchorEl, siteModel) {
      this.anchorEl = anchorEl;
      this.siteModel = siteModel;
      this.spanEl = $("<span></span>");
      this.spanEl.addClass(this.DEVGIB_SCORE_ICON_CLASS);
      this.spanEl.addClass(this.siteModel.key);
      this.spanEl.attr('title', "Loading DevGib score from " + this.siteModel.key);
    }

    IconView.prototype.attach = function() {
      return this.anchorEl.prepend(this.spanEl);
    };

    IconView.prototype.showSpinner = function() {
      this.spanEl.addClass(this.constructor.SPINNING_CLASS);
      return this.spanEl.html("" + this.constructor.SPINNER_ICON + this.constructor.PADDING_CHAR);
    };

    IconView.prototype.showScore = function(score) {
      this.spanEl.removeClass(this.constructor.SPINNING_CLASS);
      this.spanEl.addClass("" + this.DEVGIB_SCORE_CLASS_PREFIX + "-" + score);
      this.spanEl.html("" + this.siteModel.icon + this.constructor.PADDING_CHAR);
      return this.spanEl.attr('title', "DevGib " + this.siteModel.key + " score is " + score);
    };

    return IconView;

  })();

}).call(this);
