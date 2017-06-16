export PACKAGES="coreutils grep gzip sed vim bash linux-libre-headers gcc-toolchain gfortran make \
                   r-minimal r-base64enc r-jsonlite r-plotly r-feather r-devtools"

export TAR_PATH=`docker exec -e GUIX_PACKAGE_PATH=/modules -t guix guix pack -S /bin=bin -f docker $PACKAGES | grep pack | cut -d/ -f 4`
export PROFILE_HASH=`sudo docker load < /home/core/gnu/store/${TAR_PATH%?} | cut -d" " -f 3`
DOCKER_IMAGE=nextjournal/guix-base:$PROFILE_HASH
docker build -t $DOCKER_IMAGE --build-arg PROFILE_HASH=$PROFILE_HASH .

echo "Pushing to $DOCKER_IMAGE"
docker push $DOCKER_IMAGE
