ARG PROFILE_HASH
FROM profile:$PROFILE_HASH
MAINTAINER Joshua Sierles <joshua@joshua.si>
ENV PROFILE_HASH $PROFILE_HASH
ENV PATH /root/.guix-profile/bin:$PATH
RUN mkdir /tmp
RUN echo "options(repos = c(CRAN = 'http://cran.rstudio.com'), unzip = 'internal')" > .Rprofile
RUN ln -s /gnu/store/${PROFILE_HASH}-profile/etc/profile ~/.profile
COPY R.sh R.sh
RUN chmod 755 R.sh
