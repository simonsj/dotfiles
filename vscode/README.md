# Cursor

Copy from this repo to Cursor app area:

```sh
cp {keybindings,settings}.json ~/Library/Application\ Support/Cursor/User/
```

Copy from Cursor app area to here:

```sh
cp  ~/Library/Application\ Support/Cursor/User/{keybindings,settings}.json . ; cat settings.json | jq --sort-keys > out ; mv out settings.json
```
