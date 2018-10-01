# MongoDB
Mongo is an open source, NoSQL databases. You can think of it like an Array of objects that will keep track of our data even after we reboot our server.

## Installing Mongo

```
$ brew install mongodb
$ mkdir -p /data/db
$ sudo chown -R `id -un` /data/db
```

If you receive permission denied on the first two commands, try putting `sudo` in front of them (e.g. `sudo mkdir -p /data/db`).

Now, to check and make sure everything is working OK, fire up MONGO:

- `mongod` in One Terminal
- `mongo` in another Terminal
The result, is that you should see a `>`

`Control + C` to stop mongo. 

> NOTE: You will need mongo running in a tab in order to use it.

## Installing Robo 3T (formally Robomongo)

[https://robomongo.org/](https://robomongo.org/)

Robo 3T works like Postico and allows us to visualize the data.