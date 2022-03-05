#!/bin/sh
cat << "EOF"

------------------------------
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-
  _            _           
 |_  |   _   _|_  |  o   _ 
 |   |  (_)   |   |  |  _> 
                           
        PACKAGER
          Setup

------------------------------

EOF
echo "Installing Floflis Packager..."
mkdir /usr/lib/floflis
mkdir /usr/lib/floflis/packager
sudo cp -r -f --preserve=all optionals /usr/lib/floflis/packager
sudo cp -f floflis-packager /usr/bin && sudo chmod +x /usr/bin/floflis-packager
echo "Done! Run 'floflis-packager' command to use it."
