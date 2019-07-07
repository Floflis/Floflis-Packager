# Floflis App Boilerplate

Make a working and lightweight Electron app for Floflis.

* No lots of Chromium running (not implemented yet, depends upon HTML5Apps Platform)
* No huge node_modules folder; common modules and libraries shared between all apps

## Patching your app

Just move `install.sh` to your app's source. Instruct the users to download your app to `/1/Apps` folder, and to do the following command in Terminal: `cd {path_to_your_app_folder} && sudo chmod 755 install.sh && ./install.sh`.

If openning Terminal direct from the folder, it is just: `chmod 755 install.sh && ./install.sh`.

* No need to build your app; Floflis uses its own Electron binary. Works directly from your app's source-code.

**Note**: If your app is built with **Construct 2** (using Electron addon), export it as Kongregate platform. Then, edit `install.sh`

## Additional notes

Coming soon, a application store will do these tasks automatically, without needing `install.sh`.
