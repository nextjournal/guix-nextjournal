#!/bin/sh

cd /tmp
tar xJf /root/.guix-binary-0.13.0.x86_64-linux.tar.xz

echo "Copying modules to /gnu/store..."
rm -rf /gnu/store/*
mv gnu/store/* /gnu/store

echo "Copying GUIX database to /var/guix/db..."
rm -rf /var/guix/db/*
mv var/guix/db /var/guix/db
