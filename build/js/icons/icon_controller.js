(function() {
  DevGib.Icons.IconController = (function() {
    IconController.prototype.siteModel = null;

    IconController.prototype.iconView = null;

    IconController.prototype.url = null;

    function IconController(anchorEl, url, siteModel) {
      this.url = url;
      this.siteModel = siteModel;
      this.iconView = new DevGib.Icons.IconView(anchorEl, siteModel);
    }

    IconController.prototype.show = function() {
      this.iconView.attach();
      this.iconView.showSpinner();
      return this.siteModel.fetchScoreForURL(this.url, this._onFetchScoreSuccess, this._onFetchScoreFailure);
    };

    IconController.prototype._onFetchScoreSuccess = function(score) {
      return this.iconView.showScore(score);
    };

    IconController.prototype._onFetchScoreFailure = function() {
      return this.iconView.showError();
    };

    return IconController;

  })();

}).call(this);
