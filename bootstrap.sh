#!/bin/sh

mkdir -p /var/guix/profiles/per-user/root
ln -nfs /gnu/store/vy99py4x7l440y2bgc2bcvggjb5r7aa8-profile /var/guix/profiles/per-user/root/guix-profile-1-link && \
ln -nfs /var/guix/profiles/per-user/root/guix-profile-1-link /var/guix/profiles/per-user/root/guix-profile && \
ln -nfs /var/guix/profiles/per-user/root/guix-profile ~root/.guix-profile
source ~/.guix-profile/etc/profile
guix archive --authorize < ~root/.guix-profile/share/guix/hydra.gnu.org.pub
