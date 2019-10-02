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

------------------------------

EOF
. ./config || exit 1
echo "- Linking NodeJS modules..."
ln -s /1/Floflis/libs/node_modules node_modules
echo "- Installing NodeJS modules for this app..."
sudo npm install -g
if [ "$construct2" = "o" ]; then
   echo ""
   echo "(!) Detected this app/game uses Construct 2 engine. Applying special patch for C2..."
   chmod 755 c2init.sh && ./c2init.sh
fi
echo "(✓) Done! Your app is ready."
