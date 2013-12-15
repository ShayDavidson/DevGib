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
      return this.iconView.showSpinner();
    };

    return IconController;

  })();

}).call(this);
