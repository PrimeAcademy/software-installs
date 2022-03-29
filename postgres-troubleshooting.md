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


## Resolving common postgres errors

### Have you tried turning it off and then back on again?

Restart your computer! Then run:

```
# See if it's running again
brew services list

# If not, try restarting again
brew services restart postgresql

# Check to see if that fixed it
brew services list
```


### postmaster.pid already exists

Postgres sometimes has trouble if your computer shuts down unexpectedly (eg, out of battery). Deleting your `postmaster.pid` file can resolve this type of error. But first you need to find the file!

Try:

```
ls /usr/local/var/postgres/postmaster.pid

# or

ls /opt/homebrew/var/postgres/postmaster.pid

# or

ls $PGDATA/postmaster.pid
```

One of these commands will hopefully print out the file path (if it prints nothing, the file is not there). If so, you may remove the file and restart postgres:

```
# use your located file path here 👇
rm /usr/local/var/postgres/postmaster.id

# Restart the service
brew services restart postgresql

# Verify it's running
brew services list
```

----

If you _cannot_ find the `postmaster.pid` file, read through the [_Debugging Postgres Errors_](#debugging-postgres-errors) section, then follow the direction below.

Your [error log file](#debugging-postgres-errors) might show something like:

> FATAL:  lock file "postmaster.pid" already exists
> HINT:  Is another postmaster (PID 467) running in data directory "/opt/homebrew/var/postgres"?

The "data directory" is where the `postmaster.pid` file is located. You should not be able to run 

```
# Remove the pid file
rm /opt/homebrew/var/postgres/postmaster.pid

# Restart the service
brew services restart postgresql

# Verify it's running
brew services list
```


### The data directory was initialized by PostgreSQL version...

You may see an error in your [error log file](#debugging-postgres-errors) like:

> The data directory was initialized by PostgreSQL version 13, which is not compatible with this version 14.1.

The version numbers might be different, but the general error will be the same. 

Use `brew` to fix this error:

```
brew postgresql-upgrade-database
```

Then restart your database:

```
brew services restart postgresql

# verify it's running
brew services list
```

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

