# Floflis Packager

Make a working and lightweight Electron app for Floflis.

* No lots of Chromium running (not implemented yet, depends upon HTML5Apps Platform)
* No huge node_modules folder; common modules and libraries shared between all apps on Floflis

## Patching your app

Just move `install.sh` and `config` file to your app's source. Instruct the users to download your app to `/1/Apps` folder, and to do the following command in Terminal:

```bash
cd {path_to_your_app_folder} && sudo chmod 755 install.sh && ./install.sh
```

If openning Terminal direct from the folder, it is just: `chmod 755 install.sh && ./install.sh`.

* No need to build your app; Floflis uses its own Electron binary. Works directly from your app's source-code.

**Note for Construct 2 developers**: If your app is built with **C2 game engine** (using Electron addon), export it as `Kongregate` platform. Then, edit `config` file and on `construct2="x"`, replace `x` to `o` to confirm your project is done with Construct 2 (C2) engine.
Also, move the file `optionals/Construct 2/c2init.sh` to your app's folder (alongside `install.sh`) and distribute your C2 app with a `.tar.gz` archive release, using `c2init.sh` on every time you export your project, but then removing the symlinks for packaging a lightweight release (no need for this manual work on next versions, as it will have a script for that). Also note you can build for Construct 2 only in Floflis, but a Floflis subsystem installer will be done for other platforms.

### Additional notes

Coming soon, a application store will do these tasks automatically, without needing `install.sh`.

### To do

* __Floflis tree folder installable on Linux emulators__ Internet Cat will install Floflis tree in Unices (MacOS/Linux) and Windows
* Script to move need scripts to choosen folder
* If node_modules is found, ask to move it
* Ask to open Electron app, detect it doesn't opens, and teach
* Ask if it is Construct 2
* `c2package.sh` for packaging for Construct 2 projects
* FMWK for C2, and symlink from `../Floflis/libs`
* On Linuxes other than Floflis, symlink `node_modules` from `/usr/lib` instead of `/1/Floflis/libs`
* Installed in Floflis as CLI application store
* Support Construct 3, Godot, Unity and GDevelop engines
* Ask if user really want to use `npm install`
