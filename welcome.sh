#!/bin/bash

# Get system information
HOSTNAME=$(hostname)
OS=$(lsb_release -ds)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
CPU=$(lscpu | grep 'Model name' | awk -F: '{print $2}')
CPU_CORES=$(nproc)
MEMORY_TOTAL=$(free -m | awk '/^Mem:/{print $2}')
MEMORY_USED=$(free -m | awk '/^Mem:/{print $3}')
MEMORY_PERCENT=$((MEMORY_USED * 100 / MEMORY_TOTAL)) # Calculate memory usage percentage
DISK_TOTAL=$(df -h --total | grep 'total' | awk '{print $2}')
DISK_USED=$(df -h --total | grep 'total' | awk '{print $3}')
DISK_PERCENT=$(df -h --total | grep 'total' | awk '{print $5}') # Get disk usage percentage
PUBLIC_IP=$(curl -s ifconfig.me)
SERVER_LOCATION=$(curl -s ipinfo.io/$PUBLIC_IP | jq -r '.city + ", " + .region + ", " + .country')
ISP=$(curl -s ipinfo.io/$PUBLIC_IP | jq -r '.org')

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Create ASCII art with colors
echo -e "${RED}  ________  ___      ___  ________   ${NC}"
echo -e "${GREEN} /\"       )|\"  \\    /\"  ||\"      \"\\  ${NC}"
echo -e "${YELLOW}(:   \\___/  \\   \\  //   |(.  ___  :) ${NC}"
echo -e "${BLUE} \\___  \\    /\\\\  \\/.    ||: \\   ) || ${NC}"
echo -e "${MAGENTA}  __/  \\\\  |: \\.        |(| (___\\ || ${NC}"
echo -e "${CYAN} /\" \\   :) |.  \\    /:  ||:       :) ${NC}"
echo -e "(_______/  |___|\\__/|___|(________/  ${NC}"
echo
echo -e "Welcome to ${RED}$HOSTNAME${NC}!"
echo
echo -e "OS: ${GREEN}$OS${NC}"
echo -e "Kernel: ${BLUE}$KERNEL${NC}"
echo -e "Uptime: ${YELLOW}$UPTIME${NC}"
echo
echo -e "CPU: ${MAGENTA}$CPU${NC}"
echo -e "Cores: ${CYAN}$CPU_CORES${NC}"
echo -e "CPU Usage: ${MAGENTA}$MEMORY_PERCENT%${NC}"
echo
echo -e "Memory: ${RED}$MEMORY_USED MB / $MEMORY_TOTAL MB (${MAGENTA}$MEMORY_PERCENT%${RED})${NC}"
echo
echo -e "Disk: ${GREEN}$DISK_USED / $DISK_TOTAL (${MAGENTA}$DISK_PERCENT${GREEN})${NC}"
echo
echo -e "Public IP: ${CYAN}$PUBLIC_IP${NC}"
echo -e "Server Location: ${CYAN}$SERVER_LOCATION${NC}"
echo -e "ISP: ${CYAN}$ISP${NC}"
