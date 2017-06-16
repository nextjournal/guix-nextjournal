# GUIX for Nextjournal

`base-image` contains a Dockerfile and wrapper scripts for Nextjournal's default base image. All code cells execute with this environment by default. For each language, it should include:

- A minimal runtime
- Supporting packages for Nextjournal's connector (plotly, feather, etc)
- Build environment or package installer tools for use in setup cells. For example, gcc, gfortran, conda.

`guix-core` contains a Dockerfile and supporting scripts for running the Guix daemon and client on a build host.

`manifests` contains Guix manifests for use with `guix package`. These don't work yet with `guix pack` for building docker images. For now, they are just here for experimenting with Guix as a mounted filesystem.

`nextjournal/packages` contains modules not we want available but which aren't found upstream at https://www.gnu.org/software/guix/packages.
