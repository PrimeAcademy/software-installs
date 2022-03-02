# Troubleshooting Postgres

This guide assumes that postgres was installed using `brew`.

## Is postgres running?

To see if postgres is running, run:

```
brew services list
```

You should see something like:

```
Name          Status  User Plist
postgresql    started edan /Users/edan/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

If _Status_ does not show up as `started`, try starting or restarting postgres:

```
brew services restart postgresql
# or
brew services start postgresql
```

If `brew services list` continues to show an _error_ status, continue with the troubleshooting guide below.

## Debugging Postgres Errors

**1. Find your error log file**

Postgres may write logs to a couple different file locations, depending on how your computer is setup. First thing is to figure out where that file is.

Try:

```
ls /usr/local/var/log/postgres.log
```

or:

```
ls /opt/hombrew/var/postgres.log
```

If either one of these responds back with that file name, that's your log file and you can skip to the next section. 

If neither command works, we'll have to dig deeper. Run `brew services list` again, and you should see something like:

```
Name          Status  User Plist
postgresql    started edan /Users/edan/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Copy that _Plist_ file name, and `cat` it. For example:

```
cat /Users/edan/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

You'll see something in there like:

```xml
<key>StandardErrorPath</key>
<string>/usr/local/var/log/postgres.log</string>
```

Where it says `/usr/local/var/log/postgres.log` --- that's your log file! Yours might be a little different, depending on how your computer is setup.

**2. View your error logs, to see the error details**

Run

```
tail NAME_OF_LOG_FILE_FROM_ABOVE
```

eg `tail /usr/local/var/log/postgres.log`

Then google the error message! You may find something useful!

### Common postgres errors

**postmaster.pid already exists**

Your error log file might show something like:

> FATAL:  lock file "postmaster.pid" already exists
> HINT:  Is another postmaster (PID 467) running in data directory "/opt/homebrew/var/postgres"?

To fix this, we can delete that `postmaster.pid` file. That file could be in different locations, depending on your computer. But according to that _HINT_, it should be in `/opt/homebrew/var/postgres`. So to delete it, you'd run:

```
rm /opt/homebrew/var/postgres/postmaster.pid
```

You may then need to restart postgres:

```
brew services restart postgresql
```

**The data directory was initialized by PostgreSQL version...**

> The data directory was initialized by PostgreSQL version 13, which is not compatible with this version 14.1.

The version numbers might be different, but the general error will be the same. 

Use `brew` to fix this error:

```
brew postgresql-upgrade-database
```
