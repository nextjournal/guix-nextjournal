ARG PROFILE_HASH
FROM profile:$PROFILE_HASH
MAINTAINER Joshua Sierles <joshua@joshua.si>
ARG PROFILE_HASH
ENV PROFILE_HASH $PROFILE_HASH
ENV PATH /root/.guix-profile/bin:$PATH
RUN echo $PROFILE_HASH
RUN echo "options(repos = c(CRAN = 'http://cran.rstudio.com'), unzip = 'internal')" > .Rprofile
RUN ln -s /gnu/store/${PROFILE_HASH}-profile/etc/profile ~/.profile
RUN echo 'sh -l -c $@' > run.sh
RUN mkdir /tmp
