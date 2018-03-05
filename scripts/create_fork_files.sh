#!/bin/bash

DIR="$(dirname "$0")"

. "$DIR/common.sh"

set -ev

# Change to project root directory
cd "$DIR"
cd ../

# Copy and rename files from ./templates
# We're using `rsync` instead of `cp` because for some reason Travis now fails
# when using `cp -n` (it's the `-n` it doesn't like).
# https://github.com/travis-ci/travis-ci/issues/6307#issuecomment-363899104
setStatusMessage "Creating ./config.yml if absent"
rsync templates/config.example.yml config.yml --ignore-existing

setStatusMessage "Creating ./config.local.yml if absent"
rsync templates/config.example.yml config.local.yml --ignore-existing

setStatusMessage "Creating ./mac-custom.yml if absent"
rsync templates/mac-custom.example.yml mac-custom.yml --ignore-existing

setStatusMessage "Creating ./requirements.yml if absent"
rsync templates/requirements.example.yml requirements.yml --ignore-existing
