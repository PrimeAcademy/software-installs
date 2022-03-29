# Dotnet (.NET), Entity Framework (EF) Troubleshooting

## M1 Dotnet CLI Command Not Found

If the macOS M1/Arm Dotnet installer was used, occasionally the `dotnet` command won't be found.

First we uninstalled and then installed agan. Didn't work.

To fix:

Adding a symlink to the current dotnet executable.

`sudo ln -s /usr/local/dotnet/dotnet /usr/local/bin/`

Referenced this Stack question but altered the path for M1 dotnet installation. We

https://stackoverflow.com/questions/69943985/dotnet-command-is-not-found-in-my-mac-m1-terminal




## Use x64 installer for M1

Students on M1 running the dotnet ef add migrations command got an error like:

`A fatal error occurre. The required library libhostfxr.dylib could not be found.`

To fix:

Re-download+install dotnet for x64 (they had previously installed for ARM, because they're on M1.)

Uninstall and re-install the ef tool: dotnet tool uninstall --global dotnet-ef && dotnet tool install --global dotnet-ef

Make sure to update the PATH in your ~/.zshrc, as prompted by the dotnet tool install output. (eg. export PATH="$PATH:/Users/myuser/.dotnet/tools")


## Out of Memory Error

Also had one student run the dotnet ef add migrations command, and just have nothing happen (no logs, no files created). Turned out to be an out-of-memory error, restarting the computer fixes it. You can verify this by looking at the exit code:

```
$ dotnet ef migrations add CreateBakerTable
# nothing happens....
$ echo $?
137
```

`137` is the exit code for out of memory. Verified with activity monitor, students hadn't restarted their computer in a long time.


UPDATE: Student restarted, still had issues. I was not able to resolve this issue.

## HTTPS enabled by default in REST API tutorial

Needs a `--no-https` flag, which is no longer documented in the tutorial. This is in the instructions for the "explore dotnet" assignment.