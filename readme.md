## Node.js Boilerplate by Cameron Drake

This is a very simple Node.js Boilerplate that uses Express, Jade, Stylus, Nib and Coffeescript. It does absolutely nothing, but provides a good structure for your app as well as configured middleware so that you can immediately get to work. I've included some mixins and figures that can be helpful in making basic web layouts quickly. Although LESS is very well integrated with Node.js, I chose to use SASS because Compass is an excellent tool. This Boilerplate comes preconfigured with Production/Development Environments as well as server config files that allow you to proxy node.js (I highly recommend that you use a faster webserver like Nginx to serve static files, and proxy Node.js).

### Install Dependencies

Firstly, you will need to  install the node modules using Node Package Manger. 
```sh
cd nodejs-boilerplate/
npm install
git submodule init
git submodule update
```
Next, you will need to install Sass and Compass. You can install compass easily assuming you have Ruby installed:
```sh
gem install sass
gem install compasss
# or any other plugins you may want
gem install ceaser-easing 
gem install normalize
```

### Running the Application
To best streamline the development process this project uses grunt.js (a JavaScript Task Runner). In development, Grunt will start the server as a daemon and watch the directory for file updates and automatically compile. There is so much that you can automate with grunt, but the included gruntfile is configured to fulfill the following tasks:

* Compile Coffeescript
* Compile CSS 
* Concatenate JavaScript Files
* Minify JavaScript Files
* Restart the Server (Using Forever)

To simply compile, type: 
```sh
grunt
```
To compile and also watch for changes, type: 
```sh
grunt forever:start watch
```
In production:
```sh
grunt prod
forever start server.js -p # Don't forget the -p flag for production
```
For production, you will need to make sure that Nginx is running and that you have symlinked the public directory to the correct place for nginx.

## Goals

* Adhere to Steve Sauders Rules for High Performance Websites:
* HTML5 ready. Use the new elements with confidence.
* Designed with progressive enhancement in mind.
* CSS normalizations and common bug fixes.
* Responsive Design templates.
* Modular SASS to provide basic mixins and structure
* The latest jQuery via CDN.
* An optimized Google Analytics snippet.

## Major components:

* For server dependencies see package.json
* For client dependencies see views/includes/
* jQuery [http://docs.jquery.com/Tutorials:How_jQuery_Works]
* CoffeeScript [http://coffeescript.org/]
* Express [http://expressjs.com/guide.html]
* Compasss [http://compass-style.org/reference/compass/]
* Animate.css [http://daneden.me/animate/]
* Normalize.css [http://necolas.github.io/normalize.css/]
