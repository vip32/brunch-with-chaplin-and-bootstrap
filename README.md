# Brunch with Chaplin and Bootstrap
A skeleton (boilerplate) for [Brunch](http://brunch.io) 
based on [Chaplin](https://github.com/chaplinjs/chaplin) framework and the [Bootstrap](http://twitter.github.com/bootstrap) toolkit.

Requires [Brunch](http://brunch.io/) 1.3+.

## Getting started
* Create new project via executing `brunch new <project name>`.
Brunch with chaplin is not the default application skeleton for Brunch,
so you need to specify `--skeleton` option for the command.
* Build the project with `brunch b` or `brunch w`.
* Open the `public/` dir to see the result.
* Write your code.

See [Chaplin github page](https://github.com/chaplinjs/chaplin) or [Brunch github page](http://brunch.io/) for
documentation.

## Difference from Brunch-with-Chaplin skeleton
[Brunch-with-Chaplin skeleton](https://github.com/paulmillr/brunch-with-chaplin)
is a official skeleton for brunch. This skeleton is almost the same,
except a few changes:

* Added Header.
* Added authentication abstractions (`SessionController`, `LoginView` etc).
* CommonJS is used instead of AMD, because it's easier to use & debug.

## Features
* HTML5Boilerplate 3.0 html & css are included.
* CoffeeScript + Stylus + Handlebars as app languages
(you can change this to anything you want)
* Backbone as main framework
* Cross-module communication using the Mediator and Publish/Subscribe patterns
* Controllers for managing individual UI views
* Rails-style routes which map URLs to controller actions
* An application view as dispatcher and view manager
* Extended model, view and collection classes to avoid repetition and
enforce conventions
* Strict memory management and object disposal
* A collection with additional manipulation methods for smarter change events
* A collection view for easy and intelligent list rendering
* Client-side authentication using service providers like Facebook, Google
and Twitter

## Other
Versions of software the skeleton uses:

* Bootstrap 2.0.4
* jQuery 1.7.2
* Backbone 0.9.2
* Underscore 1.3.3
* Chaplin [2dc3b2](https://github.com/moviepilot/chaplin/commit/2dc3b2e2d0eb95678367aad3e2af0f16c889bac7)

## License
The MIT license.

Copyright (c) 2012 Vincent van Proosdij (http://github.com/vip32)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
