#!/bin/sh

if [ ! -e .env ]; then
  cp env.example .env
fi

# UID, GID, UNAMEの設定
if ! grep UID .env > /dev/null; then
  echo "UID=$(id -u $USER)" >> .env
fi
if ! grep GID .env > /dev/null; then
  echo "GID=$(id -g $USER)" >> .env
fi
if ! grep UNAME .env > /dev/null; then
  echo "UNAME=$USER" >> .env
fi