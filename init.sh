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
                           
        App patcher

------------------------------

EOF
. ./config
echo "Linking NodeJS modules..."
rm -rf node_modules
ln -sf /1/Floflis/libs/node_modules node_modules
#echo "Installing NodeJS modules for this app..."
#npm install
if [ "$construct2" = "o" ]; then
   echo "Detected this app/game uses Construct 2 engine. Applying special patch for C2..."
   chmod 755 c2init.sh
   sh /usr/lib/floflis/packager/./c2init.sh
   echo "Done patching for Construct 2."
fi
echo "Done! Your app is ready."
