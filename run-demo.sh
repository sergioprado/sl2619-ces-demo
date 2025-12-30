#!/bin/sh

WORKDIR="/home/root/subtitlev4"

echo "Entering demo application directory..."
cd "$WORKDIR" || exit

echo "Setting up fonts..."
mkdir -p /usr/share/fonts/ttf/ && ./setup_translate.sh

echo "Patching demo application..."
sed -i '/token:/ s/ | None//g' /home/root/subtitlev4/translate_play_adv.py

echo "Running demo application..."
./start_subtitlev4.sh
