#!/bin/bash
# Template that holds a lock to ensure only one instance is run at once.
#
# This is useful for longer running scripts, such as file cleanup cron jobs 
# that run every few minutes to ensure only one cleanup script it running at 
# once.
#
# This is designed to run as a cron job since it aborts rather than waiting.

# Lock file. Multiple filenames with the same name share the same lock, which is fine (for example: /usr/local/bin/runme.sh and /bin/runme.sh).
LOCKDIR="/tmp/.lock-$(basename "$0")"

#Create a cleanup to remove the lock directory before closing with trap.
function unlock {
    if ! rmdir $LOCKDIR; then
        echo "Unlock failed" 1>&2
        exit 1
    fi
}

if ! mkdir $LOCKDIR; then
    echo "Lock unable to be released, exiting ..."
    exit 1
fi

# We have the single instance lock, ensure we call unlock on exit
# including SIGTERM/SIGINT/CTRL-C.
trap "unlock" EXIT

# Lock acquired and will be automatically released by the trap unlock.

### Add code here. ###
