#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

application_id="$(jq -r '.id' manifest.webapp)"

application_exportsfolder="$(jq -r '.floflispackager.exportsfolder' manifest.webapp)"

application_type="$(jq -r '.application' manifest.webapp)"

rocketlaunch_dir="$(echo $PWD)"

proceed () {
if [ "$application_type" = "app" ]; then
   application_extension="apps"
   #echo "apps"
fi

if [ "$application_type" = "game" ]; then
   application_extension="game"
   #echo "game"
fi

mkdir /tmp/floflis
mkdir /tmp/floflis/packager
mkdir /tmp/floflis/packager/application
cp -r "$application_exportsfolder" /tmp/floflis/packager/application/$application_id
cd "/tmp/floflis/packager/application/$application_id"
rm -rf .git #tmp, this will be moved into a pre/post hook
rm -rf .github #tmp, this will be moved into a pre/post hook
cd /tmp/floflis/packager
tar -czvf $application_id.$application_extension application
mv -f $application_id.$application_extension "$rocketlaunch_dir"
rm -rf /tmp/floflis/packager/application
cd "$rocketlaunch_dir"
echo "Exported to $application_id.$application_extension!"
exit 0
}

fail () {
echo "This application have no manifest.webapp."
echo "Please create it."
exit 1
}

if [ -f "$rocketlaunch_dir/manifest.webapp" ]; then # manifest.webapp file should always be at the root of the source
   proceed
else
   fail
fi
