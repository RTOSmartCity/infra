#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo "Starting user data script execution"

sleep 10

if [ -f /lib/libsocket.so.4 ]; then
  ln -sf /lib/libsocket.so.4 /lib/libsocket.so.3
  echo "Created symbolic link for libsocket"
else
  echo "Error: /lib/libsocket.so.4 not found"
  find / -name "libsocket.so.4" -type f 2>/dev/null
fi

qconn port=8000 || echo "qconn command failed"
export SERVER_IP=13.219.193.24
echo "SERVER_IP=$SERVER_IP" >> /etc/environment
echo "User data script completed"