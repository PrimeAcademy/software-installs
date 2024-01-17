# Installing Node with NVM

NVM (Node Version Manager) is a helper tool for installing Node.

### First, it has some prerequisites.
You may need to install xcode if you haven't before.
In your terminal, run `xcode-select --install`

You will need to make sure there is a `.zshrc` file.
In your terminal, run `touch ~/.zshrc`

### M1 Only
If you have a M1/M2 Mac, and you encouter issues, you may need to try installing rosetta:
In your terminal, run `softwareupdate --install-rosetta`


## Install NVM
Next, we need to install NVM. Run this command in your terminal:

```sh
touch ~/.zshrc && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Then **Restart your Terminal.**

Now we can use `nvm` to install node:

```sh
nvm install 18
```

To verify Node was installed, run:

```sh
node -v
```

You should see something like `v18.19.0` (the exact numbers don't matter).

## MacOS Monterey+ Users: Turn Off AirPlay Receiver

If your Mac is running the MacOS Monterey operating system (or later), you'll need to turn off "AirPlay Receiver" in the “Sharing” System Preference. This is necessary for you to run a web server using our default configuration (on port `5000`). More info [here](https://developer.apple.com/forums/thread/682332).

## Troubleshooting

See 

https://github.com/nvm-sh/nvm#troubleshooting-on-macos

and

https://github.com/nvm-sh/nvm#macos-troubleshooting
