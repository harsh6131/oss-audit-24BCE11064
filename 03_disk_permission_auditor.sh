#!/bin/bash
# Script 3: Disk and Permission Auditor
# Audits important Linux directories and checks Git-related configuration paths.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
GIT_PATHS=("/etc/gitconfig" "$HOME/.gitconfig" "/usr/share/git-core")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
    echo "$DIR => Permissions: $PERMS | Size: ${SIZE:-Unavailable}"
  else
    echo "$DIR does not exist on this system"
  fi
done

echo ""
echo "Git Configuration Audit"
echo "-----------------------"

for PATH_ITEM in "${GIT_PATHS[@]}"; do
  if [ -e "$PATH_ITEM" ]; then
    DETAILS=$(ls -ld "$PATH_ITEM" | awk '{print $1, $3, $4}')
    echo "$PATH_ITEM => Permissions: $DETAILS"
  else
    echo "$PATH_ITEM => Not found"
  fi
done
