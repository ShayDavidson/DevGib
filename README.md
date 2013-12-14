DevGib
======

![devgib-logo](https://raw.github.com/iic-ninjas/DevGib/master/assets/icons/icon128.png)

A Chrome extensions that analyzes the quality of dev-related links (e.g.: Github repositories, StackOverflow questions) before accessing them.

## Grunt ##

DevGib uses grunt for building the extension. In order to use Grunt you need to:

1. Install the grunt-cli by running ```sudo npm install -g grunt-cli```.
2. Install the npm dependencies by running ```npm install``` from the root folder.

### Compile ###

To compile and preprocess the source files go into the root folder and run ```grunt```.

### Watch ###

During development it is very useful to have a background task that monitors any changes to the source files and compiles and preprocess them on the fly. You can do that by running ```grunt watch```.
