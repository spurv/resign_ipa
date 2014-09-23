#!/bin/sh

source resign_setup.sh

BASE_PATH=`pwd`
APP_EXPORT_BASE_PATH=`cd ..; pwd`
APP_EXPORT_PATH="$APP_EXPORT_BASE_PATH/resignedApp"

cd ..

IPA_NAME=`echo *.ipa`
echo ".ipa name: $IPA_NAME"
echo "APP_EXPORT_PATH: $APP_EXPORT_PATH"

# make 'resignedApp' directory
rm -d -r -f "resignedApp"
mkdir "resignedApp"

# unzip the IPA
unzip "$IPA_NAME"

cd Payload
ARCHIVE_NAME=`echo *.app`

echo "Archive name: $ARCHIVE_NAME"
cd ..

PATH_TO_SIGNATURE="Payload/$ARCHIVE_NAME/_CodeSignature/"

echo "Copying from $PATH_TO_PROVISIONING_PROFILE to Payload/$ARCHIVE_NAME/embedded.mobileprovision"

# copy new provisioning profile into the App
cp $PATH_TO_PROVISIONING_PROFILE Payload/$ARCHIVE_NAME/embedded.mobileprovision

############### BUILD IPA #####################
/usr/bin/xcrun -sdk iphoneos PackageApplication -v "Payload/$ARCHIVE_NAME" -o "$APP_EXPORT_PATH/$IPA_NAME" --sign "$SIGNING_IDENTITY" --embed $PATH_TO_PROVISIONING_PROFILE

# cleanup
rm -d -r -f Payload
