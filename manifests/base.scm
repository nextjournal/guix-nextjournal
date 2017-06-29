(packages->manifest
 (map (compose list specification->package+output)
      '("coreutils" "tar" "gawk" "grep" "gzip" "sed" "vim" "bash" "linux-libre-headers" "gcc-toolchain" "gfortran" "make"
        "libjpeg libpng gsl"
        "r-minimal" "r-base64enc" "r-jsonlite" "r-plotly" "feather"
        "julia",
        "python-arrow" "python-feather-format")))
