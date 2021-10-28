# Installing and Running Node
You should only have to install Homebrew and Node once in your time at Prime. Follow the instructions below.

## Installing Homebrew and Node.js (one-time)

1. [Install Homebrew](http://brew.sh/). This will be done on the command line (Terminal)
2. Once Homebrew is installed, run the command: `brew install node`
3. When this is complete, run this at your Terminal: `node --version` If you see a number, you are good to go.

## Disabling the Airplay Receiver

Mac OS Monterey introduced a [_Airplay Receiver_ feature](https://9to5mac.com/2021/06/20/macos-monterey-airplay-to-mac/) which conflicts with some functionality of node apps. If you're To prevent any issues:

- [Make sure you're using Monterey or later](https://support.apple.com/en-us/HT201260) (if not, no further action is needed)
- Open _Software Preferences_
- Go to _Sharing_
- Uncheck the _Airplay Receiver_ service

![airplay receiver screenshot](https://user-images.githubusercontent.com/1153371/139333479-55a8d2ac-42d2-4374-93fc-490c3a082b37.png)


## Running Code Using Node
In order for our app to run and serve the files we need, you'll need to run Node and point it to our server file. Otherwise we can run any old JS file with Node.

Default method to tell Node to run a JavaScript file: `node /path/to/javascriptFile.js`

### Start Your Server

Typically at Prime we use this to start a web server: `node server/app.js` or `node server/server.js`

### Stopping the Server

In the Terminal window that is running the server, hit the keys Control + C (to Cancel). You will see: '^C'

### HALP! I closed the Terminal window!

If you no longer have a window in which to type `Control + C`, you can stop all node instances on your computer by running this in your terminal: `killall node`
