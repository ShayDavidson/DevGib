# TODO #

### FEATURES ###

__Icons__

* Fix ellipsis for long questions in Google.
* Fix Github repository regex - contain numbers and special chars, but not 'settings'/'site'/'dashboard'/'blog'/'repositories'.

__Extension__

* Allow to enable/disable sites from the extension.
* Add icon for disable/enable.

__Scoring__

* Add site score for Github.
* Add site score for StackOverflow.
* Add spinner as site score is loaded.


### REFACTOR ###

* Consider handing the icons an instance of a site each instead of each having the singleton.
* Use mutation observers instead of dom events and improve performance for anchor searching.
* Clean up `index.js` file (add anchor traverse class and extract the tagged attribute to constant).


### BUILD ###

* Consider removing 'build' folder from repo.
* Add grunt-chrome-package.
* Add grunt min/contact for js.



