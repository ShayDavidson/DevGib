# TODO #

### FEATURES ###

__Extension__

* Allow to enable/disable sites from the extension.
* Add icon for disable/enable.

__Scoring__

* Add site score for Github.
* Add site score for StackOverflow.
* Add spinner as site score is loaded.


### REFACTOR ###

* Consider handing the icons an instance of a site each instead of each having the singleton, and save the url for each model.
* Use mutation observers instead of dom events and improve performance for anchor searching.
* Clean up `index.js` file (add anchor traverse class and extract the tagged attribute to constant).


### BUILD ###

* Consider removing 'build' folder from repo.
* Add grunt-chrome-package.
* Add grunt min/contact for js.



