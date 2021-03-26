# Installing SSH Key on Macbook for GitHub access

An SSH Key is a special file that git uses to login to Github from the terminal. To setup the SSH access to Github, we need to create the key file on our computer, and then register it with our Github account. You will have to do this on each different computer you use.

## Video Walkthrough
https://vimeo.com/520099465
Password: pr1me

## Script
Because there are so many steps, we've found it easiest to do this via a script.
In your terminal (zsh or bash), paste and enter the following:
```
bash <(curl -sSL https://raw.githubusercontent.com/PrimeAcademy/software-installs/master/git-ssh.sh)
```
Enter your email.

Then, go to https://github.com/settings/ssh/new

Copy the SSH key the script generated into the key field, and give it a name. 

After you add, should be good!

## (INSTRUCTOR USE ONLY) Manual Install
### Create the SSH Key
1. Open terminal.
1. Paste the following code into the terminal, substituting "youremail@whatever.com" for your actual email address:
  ```
  $ ssh-keygen -t -rsa -b 4096 -C "youremail@whatever.com"
  ```
3. This generates a new SSH key, using the provided email as a label.
  ```
  > Generating public/private [your GitHub email] key pair.
  ```
4. When your promted to "Enter a file in which to save the key," press `Enter`. This accepts the default location.
```
> Enter a file in which to save the key (/Users/you/.ssh/id_youremailaddress):
```
5. At the prompt, type a secure passphrase. (This is optional. Using a passphrase will require you to enter the passphrase each time you attempt to authenticate with GitHub.)


### Add your SSH Key to the ssh-agent
**DO NOT USE A THIRD-PARTY LIBRARY TO ADD THE SSH KEY!** Use the native MacBook `ssh-add` command.

1. Start the ssh-agent in the background.
```
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

2. On macOS Sierra 10.12.2 or later, you need to modify your `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain.

    1. First, check if the `~/.ssh/config` file exists:
        ```
          $ open ~/.ssh/config
          > The file /Users/you/.ssh/config does not exist.
        ```
    1. If the file doesn't exist, create the file.
        ```
          $ touch ~/.ssh/config
        ```
    1. Open your ~/.ssh/config file, then modify the file, replacing ~/.ssh/id_ed25519 if you are not using the default location and name for your id_ed25519 key.
        ```
        Host *
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/id_ed25519
          ```
      ** NOTE: If you choose to omit the passphrase to your key, omit the `UseKeychain` line.

    4. Add your SSH private key to the ssh-agent and store your passphrase in the keychain. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.
        ```
        $ ssh-add -K ~/.ssh/id_ed25519
        ```

    **Note: The -K option is Apple's standard version of ssh-add, which stores the passphrase in your keychain for you when you add an ssh key to the ssh-agent. If you chose not to add a passphrase to your key, run the command without the -K option.**

    **If you don't have Apple's standard version installed, you may receive an error. For more information on resolving this error, see "Error: ssh-add: illegal option -- K."**

## Add the SSH Key to your GitHub account.
1. Copy the SSH public key to your clipboard.

    If your SSH public key file has a different name than the example code, modify the filename to match your current setup. When copying your key, don't add any newlines or whitespace.
      ```
        $ pbcopy < ~/.ssh/id_ed25519.pub
        # Copies the contents of the id_ed25519.pub file to your clipboard
      ```
    **Tip: If pbcopy isn't working, you can locate the hidden .ssh folder, open the file in your favorite text editor, and copy it to your clipboard.**
1. In the upper-right corner of any page, click your profile photo, then click `Settings`.
1. In the user settings sidebar, click `SSH and GPG keys`.
1. Click `New SSH key` or `Add SSH Key`.
1. In the `Title` field, add a descriptive label for the new key. For example, if you're using a personal Mac, you might call this key "Personal MacBook Air."
1. Paste your key into the "Key" field.
1. Click `Add SSH key.`
1. If prompted, confirm your GitHub password.
