#!/usr/bin/env bash
#
TAG=$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)

echo "Tagging $TAG"
git tag $TAG

echo "Pushing to Github, which triggers a Docker Hub automated build for nextjournal/guix:$TAG"
git push --tags
git push
