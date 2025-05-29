#!/bin/bash

# ifconfig prints a ton of data but we only care about ...
/sbin/ifconfig eth0 | 

# ... this line ... 
grep 'inet addr' | 

# ... specifically this part ...
awk -F':' '{print $2}' |

# ... which after a little cleaning will print the ip address :D 
awk '{print $1}'

# Start
echo "[Docker] Starting TimeServer on $(hostname)"

# Start IdServer
go run src/server/main.go

# Stop
echo "[Docker] TimeServer stopped"