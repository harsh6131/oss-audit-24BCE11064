#!/bin/bash
# Script 5: Open Source Manifesto Generator
# This script asks the user questions, builds a short manifesto, and saves it to a text file.
# Alias idea example: you could add "alias manifesto='./05_manifesto_generator.sh'" to ~/.bashrc.

echo "Answer three questions to generate your manifesto."
echo ""

read -r -p "1. Name one open-source tool you use every day: " TOOL
read -r -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -r -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

PARAGRAPH="On $DATE, I reflected on how open source shapes my daily work. The tool I rely on most is $TOOL, and it reminds me that software becomes stronger when people are free to inspect, improve, and share it. To me, freedom means $FREEDOM, and that value is worth protecting in technology. If I could build one thing for the community and share it openly, it would be $BUILD, because knowledge grows when access is not restricted."

echo "$PARAGRAPH" > "$OUTPUT"

echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
cat "$OUTPUT"
