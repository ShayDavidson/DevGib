![devgib-logo](https://raw.github.com/iic-ninjas/DevGib/master/public/logos/logo-with-slogan.png)

DevGib is a Chrome extension that analyzes the quality of dev-related links (e.g.: Github repositories, StackOverflow questions) before accessing them.

# How does it work #

Every analyzed anchor in a web page receives a score value between 0 and 10.

## Github ##

__Github__ repos are scored according to this formula:

```
    ln( <number of watchers> )
    +
    ln( <number of forks> )
```

## Stackoverflow ##

__Stackoverflow__ questions are scored according to this formula:

```
    2 as base score
    +
    ln( <accumulated score of all answers> )
    +
    4 points if the question has an accepted answer
```

# Developers

## Grunt ##

DevGib uses grunt for building the extension. In order to use Grunt you need to:

1. Install the grunt-cli by running ```sudo npm install -g grunt-cli```.
2. Install the npm dependencies by running ```npm install``` from the root folder.

__Compile__

To compile and preprocess the source files go into the root folder and run ```grunt```.

__Watch__

During development it is very useful to have a background task that monitors any changes to the source files and compiles and preprocess them on the fly. You can do that by running ```grunt watch```.


# Libraries used

- jQuery (https://github.com/jquery/jquery).
- FontAwesome (https://github.com/FortAwesome/Font-Awesome).
- Underscore (https://github.com/jashkenas/underscore).
- Underscore.String (https://github.com/epeli/underscore.string).
- Underscore Rate Limiter (https://gist.github.com/mattheworiordan/1084831).