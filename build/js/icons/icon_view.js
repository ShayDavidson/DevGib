(function() {
  DevGib.Icons.IconView = (function() {
    IconView.SPINNER_ICON = '&#xf110;';

    IconView.ERROR_ICON = '&#xf11a;';

    IconView.SPINNER_CLASS = 'devgib-spinner';

    IconView.ERROR_CLASS = 'devgib-error';

    IconView.ICON_SPACE_CLASS = 'devgib-icon-space';

    IconView.SCORE_ICON_CLASS = 'devgib-score-icon';

    IconView.SCORE_CLASS_PREFIX = 'devgib-score';

    IconView.SPINNER_TITLE = "Loading DevGib score from %s";

    IconView.SCORE_TITLE = "DevGib %s score is %s";

    IconView.ERROR_TITLE = "DevGib failed fetching the link's score";

    IconView.prototype.anchorEl = null;

    IconView.prototype.spanEl = null;

    IconView.prototype.siteModel = null;

    function IconView(anchorEl, siteModel) {
      this.anchorEl = anchorEl;
      this.siteModel = siteModel;
      this.spanEl = $("<span></span>");
      this.spanEl.addClass(this.constructor.SCORE_ICON_CLASS);
      this.spanEl.addClass(this.siteModel.key);
    }

    IconView.prototype.attach = function() {
      this.anchorEl.prepend($("<span class=" + this.constructor.ICON_SPACE_CLASS + ">&nbsp;</span>"));
      return this.anchorEl.prepend(this.spanEl);
    };

    IconView.prototype.showSpinner = function() {
      this.spanEl.addClass(this.constructor.SPINNER_CLASS);
      this._showTitle(this.constructor.SPINNER_TITLE, [this.siteModel.key]);
      return this._showIcon(this.constructor.SPINNER_ICON);
    };

    IconView.prototype.showError = function() {
      this.spanEl.removeClass(this.constructor.SPINNER_CLASS);
      this.spanEl.addClass(this.constructor.ERROR_CLASS);
      this._showTitle(this.constructor.ERROR_TITLE);
      return this._showIcon(this.constructor.ERROR_ICON);
    };

    IconView.prototype.showScore = function(score) {
      this.spanEl.removeClass(this.constructor.SPINNER_CLASS);
      this.spanEl.addClass("" + this.constructor.SCORE_CLASS_PREFIX + "-" + score);
      this._showTitle(this.constructor.SCORE_TITLE, [this.siteModel.key, score]);
      return this._showIcon(this.siteModel.icon);
    };

    IconView.prototype._showTitle = function(text, args) {
      if (args == null) {
        args = [];
      }
      args.unshift(text);
      return this.spanEl.attr('title', _.string.sprintf.apply(null, args));
    };

    IconView.prototype._showIcon = function(icon) {
      return this.spanEl.html(icon);
    };

    return IconView;

  })();

}).call(this);
