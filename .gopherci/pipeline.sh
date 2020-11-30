#!/bin/bash

# pipeline.sh - trusted pipeline script for gopherci for Gopherbot

source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

if [ -n "$NOTIFY_USER" ]
then
    FailTask notify $NOTIFY_USER "Gopherbot build failed"
fi

FailTask email-log parsley@linuxjedi.org

# Initialize ssh for updating docs repo
AddTask ssh-init

# Make sure github is in known_hosts
AddTask ssh-scan github.com

# Clone existing gh-pages
AddTask git-clone https://github.com/lnxjedi/gopherbot.git gh-pages gopherbot-doc

# Build new
AddTask exec ./.gopherci/mkdocs.sh

# Publish doc updates (if any)
AddTask exec ./.gopherci/publishdoc.sh
AddTask notify $NOTIFY_USER "Completed successful documentation build"
