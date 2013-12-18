(function() {
  DevGib.Icons.IconController = (function() {
    IconController.prototype.siteModel = null;

    IconController.prototype.iconView = null;

    IconController.prototype.url = null;

    function IconController(anchorEl, url, siteModel) {
      this.url = url;
      this.siteModel = siteModel;
      this.iconView = new DevGib.Icons.IconView(anchorEl, siteModel);
      _.bindAll(this, '_onFetchScoreSuccess', '_onFetchScoreFailure');
    }

    IconController.prototype.show = function() {
      this.iconView.attach();
      return this.iconView.showSpinner();
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
