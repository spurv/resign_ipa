resign_ipa
==========

Did your provisioning profile on your .ipa file run out? This script will resign your app without touching anything else.

Usage In the script resign_setup.sh you setup the paths to your updated provisioning profile, and your signing indentity. When ready, you execute the resign.sh script. The folder structure should be:

resign_ipa ---------myapp.ipa ---------[scripts] -----resign.sh -----resign_setup.sh

The final - resigned - .ipa will be saved in a folder called 'resignedApp'.
