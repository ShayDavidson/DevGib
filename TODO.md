# TODO #

1. Added a popup on clicking the icon:
 a. Popup has Don't show score icons (also hides all current anchors). If disabled, icon turns red.
 b. Popup has Disable by site (appears with icon). Doesn't hide current anchors.
 c. Clean up `index.js` file (add anchor traverse class and extract the tagged attribute to constant).

2. Improve the stack overflow experience and code:
 a. Remove the complex abstraction from abstract_site querying.
 b. Research stackoverflow batching.
 c. Try to increase quota of Stackoverflow with authentication/api key.

3. Add Github scoring (+readme explanation).

4. General refactor:
 a. Add grunt-chrome-package.
 b. Use mutation observers instead of dom events and improve performance for anchor searching.
 c. Order the classes with separators to separate must-be-implemented stuff and internals.
 d. Added a default span to the icons so the links don't change places after the icon is loaded from spinner (char width)
 e. Use promises.
