chrome.browserAction.onClicked.addListener (tab) ->
  chrome.browserAction.setIcon(
    path : 'assets/icons/icon38-disabled.png',
    tabId: tab.id
  )