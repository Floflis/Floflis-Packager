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

#if [ "$running_notfrom_exportsfolder" = "true" ]; then
#   
#else
#   
#fi

source_exportsfolder="$(jq -r '.floflispackager.exportsfolder' manifest.webapp)"
source_rootfolder="$(echo $PWD)"
#export source_exportsfolder && export source_rootfolder
cd "$source_exportsfolder"
. ./config
echo "Linking NodeJS modules..."
rm -rf node_modules
ln -sf /1/Floflis/libs/node_modules node_modules
#echo "Installing NodeJS modules for this app..."
#npm install
if [ "$construct2" = "o" ]; then
   echo "Detected this app/game uses Construct 2 engine. Applying special patch for C2..."
   sh /usr/lib/floflis/packager/optionals/construct-2/./c2init.sh
   echo "Done patching for Construct 2."
fi
echo "Done! Your app is ready."
