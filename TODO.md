# TODO #

1. Added a popup on clicking the icon:
 * Popup has a place to insert access token.
 * Popup has Don't show score icons (also hides all current anchors). If disabled, icon turns red.
 * Popup has Disable by site (appears with icon). Doesn't hide current anchors.
 * Clean up `index.js` file (add anchor traverse class and extract the tagged attribute to constant).

2. Improve the site experience:
 * Try to increase quota of Stackoverflow with authentication/api key.
 * Try to increase quota of Github with authentication/api key.
 * Explain in README how to insert github auth key and stackoverflow.

3. General refactor:
 * Added which libs I used and the font awesome thing + link to license at the end of Readme.
 * Add grunt-chrome-package.
 * Add grunt-contrib-concat (https://github.com/gruntjs/grunt-contrib-concat)
 * Add grunt-contrib-uglify.
 * Add grunt source mapping for coffee?
 * Use mutation observers instead of dom events and improve performance for anchor searching (http://stackoverflow.com/questions/20582991/how-to-know-when-google-search-results-page-renders-its-results)
 * Added a default span to the icons so the links don't change places after the icon is loaded from spinner (char width).
