#!/bin/bash
set -eu

SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME:$SERVER_DESTINATION"
# sync it up"
echo "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
