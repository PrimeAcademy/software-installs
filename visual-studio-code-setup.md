# Visual Studio Code Setup
Suggested visual studio code environment for Prime.

Install from the web: https://code.visualstudio.com/download

## Shortcuts and handy tricks
- Turn on auto save. `File > Auto Save`
- `Cmd-Shift-P` does a lot of things
- typing `log` suggests `console.log` (taken from here [https://stackoverflow.com/a/42341137/3644991](https://stackoverflow.com/a/42341137/3644991))
  1. Go to `Preferences` -> `User Snippets` -> Choose `Javascript`
  2. Replace the content in this file with:
    ```JavaScript
    {
      // Place your snippets for JavaScript here. Each snippet is defined under a snippet name and has a prefix, body and 
      // description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
      // $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
      // same ids are connected.
      // Example:
      "Print to console": {
        "prefix": "log",
        "body": [
          "console.log('$1');",
          "$2"
        ],
        "description": "Log output to console"
      }
    }
    ```
  3. Open Settings (`Cmd + ,` on Mac)
  4. Add the following line to your personal settings: `"editor.snippetSuggestions": "top"`
- html shorthand [https://marketplace.visualstudio.com/items?itemName=sidthesloth.html5-boilerplate](https://marketplace.visualstudio.com/items?itemName=sidthesloth.html5-boilerplate)
  1. Install Visual Studio Code 0.10.1 or higher
  2. Launch VS Code
  3. Launch the command palette by using `Cmd-Shift-P`
  4. Type in `Install Extension` and select `'Extensions : Install Extensions'`
  5. Type HTML5 Boilerplate
  6. Choose the extension from the drop down
  7. Reload Visual Studio Code
- shell commands (using `code .` to open) https://code.visualstudio.com/docs/editor/command-line
  1. Install Visual Studio Code 0.10.1 or higher
  2. Launch VS Code
  3. Launch the command palette by using `Cmd-Shift-P`
  4. Type in `Shell Command` and select `Shell Command : Install 'code' command in PATH`
- Default keybindings: [https://code.visualstudio.com/docs/getstarted/keybindings
](https://code.visualstudio.com/docs/getstarted/keybindings)
	- Delete an entire line `⇧⌘K`	

# STOP HERE FOR NOW (This bottom part is for next week)

## Debugging
Debugging node.js applications (once per application)

1. Click the debug icon (bug with a slash over it) on the left-hand tool bar
2. Configure or Launch button settings/cog icon. This will likely have an orange dot on it
3. Select node from the dropdown
4. Change the `"program":` to your actual starting file (likely `"${workspaceRoot}/app.js"` or `"${workspaceRoot}/server/app.js"`. This will automatically be correct if your `main` property in `package.json` is set to the correct location (likely `"app.js"` or `"server/app.js"`)
5. Click `Add Configuration` button in lower right corner and select `{} Node.js: Attach`
6. Change the `"port"` to your port number
7. `launch.json` should end up looking like this
```
{
    // Use IntelliSense to learn about possible Node.js debug attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "attach",
            "name": "Attach",
            "port": 5000
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${workspaceRoot}/server/app.js"
        }
    ]
}
```
