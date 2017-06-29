#!/bin/sh
#
# Runs the base container with the guix daemon. Clients exec into this container to run builds.
#


docker run -it -d -e GUIX_PACKAGE_PATH=/modules --name guix -v $PWD/../modules:/modules -v guix-store:/gnu/store guix-var:/var/guix nextjournal/guix
