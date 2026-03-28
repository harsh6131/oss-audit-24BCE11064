#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks whether a package is installed and prints package metadata.

PACKAGE=${1:-git}

print_package_info() {
  if command -v rpm >/dev/null 2>&1; then
    if rpm -q "$PACKAGE" >/dev/null 2>&1; then
      echo "$PACKAGE is installed."
      rpm -qi "$PACKAGE" | grep -E 'Name|Version|License|Summary'
    else
      echo "$PACKAGE is NOT installed."
    fi
  elif command -v dpkg >/dev/null 2>&1; then
    if dpkg -s "$PACKAGE" >/dev/null 2>&1; then
      echo "$PACKAGE is installed."
      dpkg -s "$PACKAGE" | grep -E 'Package|Version|Homepage|Description|Maintainer'
    else
      echo "$PACKAGE is NOT installed."
    fi
  else
    echo "No supported package manager found. Install rpm or dpkg."
    exit 1
  fi
}

print_license_hint() {
  case "$PACKAGE" in
    git)
      echo "Git: the version-control system Linus built when proprietary tooling failed him."
      ;;
    apache2|httpd)
      echo "Apache: the web server that helped build the open internet."
      ;;
    mysql)
      echo "MySQL: open source infrastructure at the heart of millions of applications."
      ;;
    firefox)
      echo "Firefox: a community-backed browser defending an open web."
      ;;
    vlc)
      echo "VLC: a media player shaped by openness and broad device support."
      ;;
    python3|python)
      echo "Python: a language grown by community governance and shared improvement."
      ;;
    *)
      echo "$PACKAGE: no custom philosophy note is defined yet."
      ;;
  esac
}

echo "=============================================="
echo " FOSS Package Inspector"
echo "=============================================="
echo "Package selected: $PACKAGE"

print_package_info
echo ""
print_license_hint
