#!/bin/sh
#
# build every available package. if substitutes are not available, fall back to compilation. if a build fails, keep going.
#

guix build --quiet --keep-failed --keep-going `guix package -A | cut -f1,2 --output-delimiter=@` --fallback
