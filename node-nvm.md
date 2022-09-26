# Installing Node with NVM

NVM (Node Version Manager) is a helper tool for installing Node.

First, we need to install NVM. Run this command in your terminal:

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Then **Restart your Terminal.**

Now we can use `nvm` to install node:

```sh
nvm install --lts
nvm use --lts
```

To verify Node was installed, run:

```sh
node -v
```

You should see something like `v16.17.1` (the exact numbers don't matter).

## Troubleshooting

See 

https://github.com/nvm-sh/nvm#troubleshooting-on-macos

and

https://github.com/nvm-sh/nvm#macos-troubleshooting