#!/bin/bash
# Script called by a client to create an SSH tunnel for a user on server to ssh to client.
#
# Author: ccasper@gmail.com

# This is valuable for allowing someone to SSH into a machine that is on a LAN with no external IP (which is the case 99%+ of the time)
#
# This allows me to do remote debugging of family/friends machines at their explicit request by having them run this script and contacting me.
#
# Note: This requires passwords/public keys configured in advance and the calling client to have an open port 22 SSH server.
#

# Remote ssh server information
#
# User unprivileged is an ssh user only and definitely not a sudoer.
USER=unprivileged
HOST=home.protoeng.com
PORT=10022

# Client ssh port
CLIENT_SSH_PORT=22

# Port for someone on remote server to get access to the calling client.
TUNNEL_PORT=43022

echo "To connect from ${HOST} server use: ssh localhost -p ${TUNNEL_PORT}" 
echo ""
echo "Opening reverse SSH tunnel ..."
ssh -p ${PORT} -R ${TUNNEL_PORT}:localhost:${CLIENT_SSH_PORT} ${USER}@${HOST}

