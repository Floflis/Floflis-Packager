#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

application_id="$(jq -r '.id' manifest.webapp)"

application_exportsfolder="." #tmp variable

#application_type="$(jq -r '.type' manifest.webapp)"
application_type="$(jq -r '.application' manifest.webapp)"

rocketlaunch_dir="$(echo $PWD)"

proceed () {
if [ "$application_type" = "app" ]; then
#if [[ "$application_type" = "app" ]]; then
   application_extension="apps"
   #echo "apps"
fi

if [ "$application_type" = "game" ]; then
#if [[ "$application_type" = "game" ]]; then
   application_extension="game"
   #echo "game"
fi

mkdir /tmp/floflis
mkdir /tmp/floflis/packager
mkdir /tmp/floflis/packager/application
cp -r "$application_exportsfolder" /tmp/floflis/packager/application/$application_id
#echo "Copied"
cd "/tmp/floflis/packager/application/$application_id"
rm -rf .git #tmp, this will be moved into a pre/post hook
rm -rf .github #tmp, this will be moved into a pre/post hook
#cd "$SCRIPTPATH"
#cd "$PWD"
#echo "$PWD"
#cd "$rocketlaunch_dir"
#tar -czvf $app_id.apps application/$app_id
#tar -czvf $application_id.$application_extension /tmp/floflis/packager/application
cd /tmp/floflis/packager
tar -czvf $application_id.$application_extension application
mv -f $application_id.$application_extension "$rocketlaunch_dir"
#tar -czvf "$application_id.$application_extension" /tmp/floflis/packager/application
rm -rf /tmp/floflis/packager/application
cd "$rocketlaunch_dir"
echo "Exported to $application_id.$application_extension!"
#echo "Exported to \"$application_id.$application_extension\"!"
exit 0
}

fail () {
echo "This application have no manifest.webapp."
echo "Please create it."
exit 1
}

if [ -f "manifest.webapp" ]; then
   proceed
else
   fail
fi
