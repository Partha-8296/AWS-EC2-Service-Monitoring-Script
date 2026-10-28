
#!/bin/bash

echo "===== AWS EC2 Service Health Check ====="

services=("sshd" "cron" "docker")

for service in "${services[@]}"
do
    if systemctl is-active --quiet $service
    then
        echo "$service : RUNNING"
    else
        echo "$service : STOPPED"
    fi
done

echo ""
echo "===== Disk Usage ====="
df -h

echo ""
echo "===== Memory Usage ====="
free -m

echo ""
echo "===== CPU Load ====="
uptime

echo ""
echo "Health Check Completed Successfully"
