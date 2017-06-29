#!/bin/sh

cd /tmp
tar xJf /root/.guix-binary-0.13.0.x86_64-linux.tar.xz

echo "Copying modules to /gnu/store..."
rm -rf /gnu/store/*
cp -pr gnu/store/* /gnu/store

echo "Copying GUIX database to /var/guix/db..."
rm -rf /var/guix/db/*
cp -pr var/guix/* /var/guix
