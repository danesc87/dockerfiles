#!/bin/bash -e

# This script is run when the container is in development mode. It is useful for GNU/Linux hosts only.
# In development mode, the repository is mounted inside the container rather than copied, so this script
# modifies the container's UID and GID to match the ones from the mounted server source folder.

USER="$1"

if [[ -z $USER ]]; then
    echo "USER was not specified. Exiting..."
    exit 1
fi

# Check the source folders are mounted and this script is run as root.
if [ "$UID" != "0" ]; then
    echo "This script must be run as root. Exiting..."
    exit 2
fi

# Taken from https://github.com/Graham42/mapped-uid-docker/blob/master/make-tim.sh
USERID=$(stat -c %u $SERVER_SRC_FOLDER)
GROUPID=$(stat -c %g $SERVER_SRC_FOLDER)

# Modify user's GID and UID to match the ones mounted.
if ! getent group $GROUPID > /dev/null 2>&1 ; then
    groupmod -o -g $GROUPID $USER
fi

usermod -o -u $USERID -g $GROUPID $USER
chown $USERID:$GROUPID /home/$USER
chown $USERID:$GROUPID /var/www/html
