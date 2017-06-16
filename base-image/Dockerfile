ARG PROFILE_HASH
FROM profile:$PROFILE_HASH
MAINTAINER Joshua Sierles <joshua@joshua.si>
ENV PROFILE_HASH $PROFILE_HASH
ENV PATH /root/.guix-profile/bin:$PATH
RUN mkdir /tmp /wrappers
RUN echo "options(repos = c(CRAN = 'http://cran.rstudio.com'), unzip = 'internal')" > ~/.Rprofile
RUN ln -s /gnu/store/${PROFILE_HASH}-profile/etc/profile ~/.profile
COPY wrappers/R.sh /wrappers/R.sh
RUN chmod 755 /wrappers/*.sh
