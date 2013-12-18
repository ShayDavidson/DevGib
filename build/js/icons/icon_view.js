(function() {
  DevGib.Icons.IconView = (function() {
    IconView.SPINNER_ICON = '&#xf110;';

    IconView.ERROR_ICON = '&#xf11a;';

    IconView.SPINNER_CLASS = 'spinner';

    IconView.ERROR_CLASS = 'error';

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
      this.spanEl.addClass(this.constructor.SPINNER_CLASS);
      return this._showIcon(this.constructor.SPINNER_ICON);
    };

    IconView.prototype.showError = function() {
      this.spanEl.removeClass(this.constructor.SPINNER_CLASS);
      this.spanEl.addClass(this.constructor.ERROR_CLASS);
      return this._showIcon(this.constructor.ERROR_ICON);
    };

    IconView.prototype.showScore = function(score) {
      this.spanEl.removeClass(this.constructor.SPINNER_CLASS);
      this.spanEl.addClass("" + this.DEVGIB_SCORE_CLASS_PREFIX + "-" + score);
      this.spanEl.attr('title', "DevGib " + this.siteModel.key + " score is " + score);
      return this._showIcon(this.siteModel.icon);
    };

    IconView.prototype._showIcon = function(icon) {
      return this.spanEl.html("" + icon + "&nbsp;");
    };

    return IconView;

  })();

}).call(this);
