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
sudo mkdir /usr/lib/floflis
sudo mkdir /usr/lib/floflis/packager
sudo cp -r -f --preserve=all . /usr/lib/floflis/packager
sudo mv -f /usr/lib/floflis/packager/floflis-packager /usr/bin && sudo chmod +x /usr/bin/floflis-packager
echo "Done! Run 'floflis-packager' command to use it."
