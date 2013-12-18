(function() {
  chrome.browserAction.onClicked.addListener(function(tab) {
    return chrome.browserAction.setIcon({
      path: 'assets/icons/icon38-disabled.png',
      tabId: tab.id
    });
  });

}).call(this);
