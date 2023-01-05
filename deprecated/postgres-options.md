
### Starting/Stopping Postgres (Option 2 of 2)

This method gives you a log of errors like node does. As the server receives requests and runs queries, it will give you output in the terminal.

- In your terminal, run: `postgres -D /usr/local/var/postgres` to start Postgres using the specified file location as a data directory
- To **stop** Postgres, press the control and C keys at the same time


#### Create an Environment Variable Postgres (optional)

You might find it inconvenient to start postgres by typing in all of that stuff. You can make your life easier, by setting a PGDATA environment variable.

1. In terminal, run: `cd ~` to navigate to your user’s directory
2. Open and/or create a file named `.zshrc`
2. Open the folder or file in a text editor (example: `code .`)
3. Add the following line to the end of the `.zshrc` file: 
    `export PGDATA="/usr/local/var/postgres"`
4. Save the file.
5. Close the terminal window.
6. Open a new terminal window (to see the changes take effect).
7. Run `postgres` to start your database.