# Installing and Running Node
You should only have to install Homebrew and Node once in your time at Prime. Follow the instructions below.

## Installing Homebrew and Node.js (one-time)

1. [Install Homebrew](http://brew.sh/). This will be done on the command line (Terminal)
2. Once Homebrew is installed, run the command: `brew install node@16`
3. When this is complete, run this at your Terminal: `node --version` If you see a number, you are good to go.

## Running Code Using Node
In order for our app to run and serve the files we need, you'll need to run Node and point it to our server file. Otherwise we can run any old JS file with Node.

Default method to tell Node to run a JavaScript file: `node /path/to/javascriptFile.js`

### MacOS Monterey Users: Turn Off AirPlay Receiver

If your Mac is running the MacOS Monterey operating system, you'll need to turn off "AirPlay Receiver" in the “Sharing” System Preference. This is necessary for you to run a web server using our default configuration. More info [here](https://developer.apple.com/forums/thread/682332).

### Start Your Server

Typically at Prime we use this to start a web server: `node server/app.js` or `node server/server.js`

### Stopping the Server

In the Terminal window that is running the server, hit the keys Control + C (to Cancel). You will see: '^C'

### HALP! I closed the Terminal window!

If you no longer have a window in which to type `Control + C`, you can stop all node instances on your computer by running this in your terminal: `killall node`
