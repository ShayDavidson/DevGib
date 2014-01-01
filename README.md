DevGib
======

![devgib-logo](https://raw.github.com/iic-ninjas/DevGib/master/assets/icons/icon128.png)

A Chrome extensions that analyzes the quality of dev-related links (e.g.: Github repositories, StackOverflow questions) before accessing them.

# How does it work #

Every analyzed anchor in a web page receives a score value between 0 and 10.

## Stackoverflow ##

__Stackoverflow__ questions are scored according to this formula:

```
    ACCUMULATED: <accumulated score of all answers>

    SCORE: 2 + ln( min( ACCUMULATED , 10 ) )

    If the question has an accepted answer, SCORE receives a 4 points bonus.
```
     allAnswers = data['items']
        acceptedAnswer = _.find(allAnswers, (answer) -> answer['is_accepted'])
        accumulatedScore = _.reduce(allAnswers, ((sum, answer) -> sum + answer['score']), 0)
        sanitiziedScore = Math.max(accumulatedScore, 0)

        startingScore = @constructor.BASE_SCORE
        startingScore += @constructor.ANSWER_BONUS if acceptedAnswer
        startingScore += Math.log(sanitiziedScore) if sanitiziedScore > 0

        startingScore


# Developers

## Grunt ##

DevGib uses grunt for building the extension. In order to use Grunt you need to:

1. Install the grunt-cli by running ```sudo npm install -g grunt-cli```.
2. Install the npm dependencies by running ```npm install``` from the root folder.

### Compile ###

To compile and preprocess the source files go into the root folder and run ```grunt```.

### Watch ###

During development it is very useful to have a background task that monitors any changes to the source files and compiles and preprocess them on the fly. You can do that by running ```grunt watch```.
