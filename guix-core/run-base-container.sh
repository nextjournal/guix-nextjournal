#!/bin/sh
#
# Runs the base container with the guix daemon. Clients exec into this container to run builds.
#


docker run -it -d --privileged --name guix -v /home/core/guix-nextjournal/modules:/modules nextjournal/guix
