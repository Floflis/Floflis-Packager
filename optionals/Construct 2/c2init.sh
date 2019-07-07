#!/bin/bash
cat << "EOF"

------------------------------
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-
  _            _           
 |_  |   _   _|_  |  o   _ 
 |   |  (_)   |   |  |  _> 
                           
Construct 2 app/game patcher

------------------------------

EOF
echo "Symlinking from Floflis' shared libraries for Construct 2..."
echo "sw.js:"
rm -f sw.js && ln -s /1/Floflis/libs/game-engines/c2/sw.js sw.js
echo "offlineClient.js:"
rm -f offlineClient.js && ln -s /1/Floflis/libs/game-engines/c2/offlineClient.js offlineClient.js
echo "c2webappstart.js:"
rm -f c2webappstart.js && ln -s /1/Floflis/libs/game-engines/c2/c2webappstart.js c2webappstart.js
echo "jquery-2.1.1.min.js:"
rm -f jquery-2.1.1.min.js && ln -s /1/Floflis/libs/game-engines/c2/jquery-2.1.1.min.js jquery-2.1.1.min.js
echo "index.html:"
rm -f index.html && ln -s /1/Floflis/libs/game-engines/c2/index.html index.html
