PACKAGES="coreutils tar gawk grep gzip sed vim bash linux-libre-headers gcc-toolchain gfortran make \
          libjpeg libpng gsl \
          r-minimal r-base64enc r-jsonlite r-plotly r-feather r-devtools \
          julia"

GUIX_COMMAND="guix pack -S /bin=bin -f docker $PACKAGES"

echo $GUIX_COMMAND
TAR_PATH=/home/core/gnu/store/`docker exec -e GUIX_PACKAGE_PATH=/modules -t guix $GUIX_COMMAND | grep pack | grep -v drv | cut -d/ -f 4`
TAR_PATH=${TAR_PATH%?}
echo "Loading build from $TAR_PATH"

PROFILE_HASH=`sudo docker load < $TAR_PATH | cut -d" " -f 3 | cut -d: -f 2`
DOCKER_IMAGE=nextjournal/guix-base:$PROFILE_HASH

echo "Building $DOCKER_IMAGE ..."

docker build --build-arg PROFILE_HASH=$PROFILE_HASH -t $DOCKER_IMAGE .

echo "Pushing $DOCKER_IMAGE ..."
docker push $DOCKER_IMAGE
