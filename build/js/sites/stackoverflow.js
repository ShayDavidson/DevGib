(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DevGib.Sites.Stackoverflow = (function(_super) {
    __extends(Stackoverflow, _super);

    function Stackoverflow() {
      _ref = Stackoverflow.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Stackoverflow.prototype.key = 'stackoverflow';

    Stackoverflow.prototype.host = 'stackoverflow.com';

    Stackoverflow.prototype.matchingRegex = /questions\/\d+/;

    return Stackoverflow;

  })(DevGib.Sites.AbstractSite);

}).call(this);
