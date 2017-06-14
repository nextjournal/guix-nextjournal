export PACKAGES="coreutils sed vim bash gcc-toolchain gfortran make \
                   r-minimal r-base64enc r-jsonlite r-plotly r-feather r-devtools"

# result of this line contains the tar path
# docker exec -e GUIX_PACKAGE_PATH=/modules -t guix guix pack -S /bin=bin -f docker

# export TAR_PATH/home/core/gnu/store/4dxgzhgis7bhycb2kbb4hi012fx9ib9r-docker-pack.tar.gz

# result of this line contains the profile hash
# sudo docker load < $TAR_PATH

# TODO: extract tar hash and profile hash and set it automatically

export PROFILE_HASH=0c07kaf4x8jmayh1cmzpc4ls9sh4g0ws

docker run --name guix-$PROFILE_HASH -t -d profile:$PROFILE_HASH sh
docker exec guix-$PROFILE_HASH sh -c "echo R_LIBS=/gnu/store/$PROFILE_HASH-profile/site-library > .Renviron"
docker exec guix-$PROFILE_HASH sh -c "echo options(repos = c(CRAN = \"http://cran.rstudio.com\"), unzip = 'internal') > .Rprofile"

docker exec guix-$PROFILE_HASH mkdir /tmp
DOCKER_IMAGE_HASH=`docker commit guix-$PROFILE_HASH`
DOCKER_IMAGE=nextjournal/r-guix:$PROFILE_HASH

docker tag $DOCKER_IMAGE_HASH $DOCKER_IMAGE
echo "Pushing to $DOCKER_IMAGE"
docker push $DOCKER_IMAGE
