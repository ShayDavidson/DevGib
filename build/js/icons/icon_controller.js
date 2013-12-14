(function() {
  DevGib.Icons.IconController = (function() {
    IconController.prototype.siteModel = null;

    IconController.prototype.iconView = null;

    function IconController(anchorEl, siteModel) {
      this.siteModel = siteModel;
      this.iconView = new DevGib.Icons.IconView(anchorEl, siteModel);
    }

    IconController.prototype.show = function() {
      return this.iconView.show();
    };

    return IconController;

  })();

}).call(this);
