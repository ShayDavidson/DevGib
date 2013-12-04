DevGib
======

![devgib-logo](https://raw.github.com/iic-ninjas/DevGib/master/extension/assets/icons/icon128.png)

A Chrome extensions that analyzes the quality of dev-related links (e.g.: Github repositories, Stackoverflow questions) before accessing them.

### Build ###

In order to build you need to have `CoffeeScript` installed (simply run `sudo npm install -g coffee-script`).
Now run either:

   `coffee --compile --output extension/build extension/src`

in order to compile the source once, or

   `coffee --watch --output extension/build extension/src`

in order to compile continuously as you make changes to the source.

