#!/bin/bash
#copyright stuff
source /usr/bin/raspi-config
INTERACTIVE=False
echo "Enabling OverlayFS..."
if do_overlayfs 0; then
    echo "Success"
else
    echo "Failed"
fi
