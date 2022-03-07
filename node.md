# Installing and Running Node
You should only have to install Homebrew and Node once in your time at Prime. Follow the instructions below.

## Installing Homebrew and Node.js (one-time)

1. [Install Homebrew](http://brew.sh/). This will be done on the command line (Terminal)
2. Once Homebrew is installed, run the command: `brew install node@16`
3. When this is complete, run this at your Terminal: `node --version` If you see a number with 16.X, you are good to go.
4. If you get a `command node not found` error, you need to link it. 
  - Run this in the terminal to link: `echo 'export PATH="/opt/homebrew/opt/node@16/bin:$PATH"' >> ~/.zshrc` -- close your terminal, then reopen. Try step 3 again.
  - Message that may help:
  ```
  node@16 is keg-only, which means it was not symlinked into /opt/homebrew,
because this is an alternate version of another formula.

If you need to have node@16 first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/node@16/bin:$PATH"' >> ~/.zshrc
  ```

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
