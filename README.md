# jsm

A simple **J**ava**S**cript **m**onitor that will automatically:

* concatenate a bunch of scripts in the order specified;
* check if there have been any changes since it last did this; and,
* if there are changes, copy the output to a specified location.

Really sophisticated stuff, hence the *really sophisticated* name.


## Usage

1. Add `jsm` to your path, in whatever manner befits you.
2. Add a `jsmfile` in the root of your project. (See below for formatting.)
3. Run `jsm your/preferred/output.js` in the same directory.

A `jsmfile` should look something like the following:

```
# my fabulous jsmfile

## libs
scripts/jquery.min.js

## my stuff
scripts/disable_christmas.js
scripts/reticulate_splines.js
```

That is:

* paths to source files relative to the `jsmfile`;
* one file per line; and,
* lines beginning with `#` are treated as comments.


### What it actually does

`jsm` will generate a `.jsm` directory in which to work its mischief. Every two seconds, it will loop through the files in the `jsmfile` and concatenate them to `.jsm/new`. It will then compare `.jsm/new` with `.jsm/old`. If there is no `.jsm/old`, or if the files differ, `.jsm/new` is copied to the path specified when calling `jsm`, and then moved to `.jsm/old`.

Rinse and repeat.


## But... but *minification*

There is *always* a but, huh? (He wished.)

If you want to uglify/minify/otherwise interfere with your output `.js` file, feel free to ~~use an actual tool written by someone competent~~ add an extra line to the end of the `while` loop, and dive into the famously cool and refreshing waters of dependency hell by running `npm install -g uglify-js`.

Sure, `jsm` does (at best) 0.1% of what `grunt`/`gulp`/`broccoli` do, but it also takes 0.001% of the effort to set up.


## Pro-tip

You can actually use `jsm` to monitor any folder, concatenate its contents in a specific order, and output the result. I just only ever need to do this with JavaScript files and also this way I get to call it `jsm`.


## Copylol

`jsm` is the work of [@dmrutherford](https://twitter.com/dmrutherford), whom would be delighted if you would use it and improve it. Consider it public domain, and do please accept my apologies for its existence.
