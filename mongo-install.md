# mongo-install

Mongo is an open source, NoSQL database. You can think of it like an Array of objects that will keep track of our data even after we reboot our server.

## Installing Mongo

Run these commands in the terminal one at a time:

```
brew install mongodb
mkdir -p /data/db
sudo chown -R `id -un` /data/db
```

If you receive permission denied on the first two commands, try putting `sudo` in front of them:

```
sudo brew install mongodb
sudo mkdir -p /data/db
sudo chown -R `id -un` /data/db
```

Now, to check and make sure everything is working OK, fire up MONGO:

Use brew to have it run in the background:

```
brew services start mongodb
```

__OR__

To see output in the terminal as mongo is running:
```
mongod
```

The result, is that you should see a `>`

`Control + C` to stop mongo. 

## Installing Robo 3T (formerly Robomongo)

[https://robomongo.org/](https://robomongo.org/)

Robo 3T is an application that allows us to visualize the data in Mongo.

1. Open Robo 3T
2. Click the `Create` link (really small text in the upper-left corner).
3. Click save (no need to make any changes to the default settings).
4. Click `New Connection` (the database connection you just created)
5. Click `Connect` (the button in the lower right)
