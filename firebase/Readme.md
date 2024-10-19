
# Firebase

## Run Emulator Command

Run with the seed data and ensure the data in the emulator persists between emulator restarts by adding the `--export-on-exit` flag.
```bash
firebase emulators:start --import ./seed --export-on-exit
```

After running the above command to see the emulator UI (Dashboard) open `http://127.0.0.1:4000/` and you will see the ui.
Ports are configured in the `firebase.json` file. View the file (or the log on the terminal when you run the start command) for more information and port of different firebase services in the emulator and the emulator UI.

## Deploying the Firebase Functions

```bash
firebase deploy --only functions
```

This will deploy the functions to the firebase cloud functions.
If you instead want to deploy everything from the firebase cloud functions to the rules and indexes, you can run the following command.
```bash
firebase deploy
```
