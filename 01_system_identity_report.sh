#!/bin/bash
# Script 1: System Identity Report
# Author: Harshvardhan Singh Jaisawat | Course: Open Source Software

# --- Student details ---
STUDENT_NAME="Harshvardhan Singh Jaisawat"
SOFTWARE_CHOICE="Git"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR="$HOME"
UPTIME=$(uptime -p 2>/dev/null)
CURRENT_TIME=$(date '+%d %B %Y %I:%M:%S %p')

# Read the Linux distribution name from the standard os-release file.
if [ -f /etc/os-release ]; then
  DISTRO_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
else
  DISTRO_NAME="Unknown Linux Distribution"
fi

# The Linux kernel itself is distributed under GPL v2.
OS_LICENSE_MESSAGE="Linux kernel license: GPL v2 (the full distribution may include other open-source licenses)."

# --- Display ---
echo "=============================================="
echo " Open Source Audit - $STUDENT_NAME"
echo "=============================================="
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "Distribution    : $DISTRO_NAME"
echo "Kernel          : $KERNEL"
echo "User            : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "Uptime          : ${UPTIME:-Unavailable}"
echo "Date and Time   : $CURRENT_TIME"
echo "License Note    : $OS_LICENSE_MESSAGE"
