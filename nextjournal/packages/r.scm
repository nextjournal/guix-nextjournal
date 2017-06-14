(define-module (nextjournal packages r)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system r)
  #:use-module (gnu packages image)
  #:use-module (gnu packages web)
  #:use-module (gnu packages statistics))

(define-public r-lubridate
  (package
    (name "r-lubridate")
    (version "1.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "lubridate" version))
        (sha256
          (base32
            "0ci6rwij9i1inn840m0mlh1nqgh6vm2lada9kdnjpcjp5kyfv1qs"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-stringr" ,r-stringr)))
    (home-page
      "http://cran.r-project.org/web/packages/lubridate")
    (synopsis
      "Make Dealing with Dates a Little Easier")
    (description
      "Functions to work with date-times and time-spans: fast and user friendly parsing of date-time data, extraction and updating of components of a date-time (years, months, days, hours, minutes, and seconds), algebraic manipulation on date-time and time-span objects.  The 'lubridate' package has a consistent and memorable syntax that makes working with dates easy and fun.")
    (license gpl2)))

(define-public r-maps
  (package
   (name "r-maps")
   (version "3.2.0")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "maps" version))
       (sha256
         (base32
           "0577f3b5d3a7djl7r0miy9mzr6xq6jb32p8nyrma7m2azasbwyj3"))))
   (build-system r-build-system)
   (home-page
     "http://cran.r-project.org/web/packages/maps")
   (synopsis "Draw Geographical Maps")
   (description
     "Display of maps.  Projection code and larger maps are in separate packages ('mapproj' and 'mapdata').")
   (license gpl2)))

(define-public r-ggmap
  (package
   (name "r-ggmap")
   (version "2.6.1")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggmap" version))
       (sha256
         (base32
           "0mssb09w818jv58h7mly9y181pzv22sgcd4a079cfpq04bs0wigw"))))
   (build-system r-build-system)
   (propagated-inputs
     `(("r-digest" ,r-digest)
       ("r-geosphere" ,r-geosphere)
       ("r-ggplot2" ,r-ggplot2)
       ("r-jpeg" ,r-jpeg)
       ("r-mapproj" ,r-mapproj)
       ("r-plyr" ,r-plyr)
       ("r-png" ,r-png)
       ("r-proto" ,r-proto)
       ("r-reshape2" ,r-reshape2)
       ("r-rgooglemaps" ,r-rgooglemaps)
       ("r-rjson" ,r-rjson)
       ("r-scales" ,r-scales)))
   (home-page "https://github.com/dkahle/ggmap")
   (synopsis "Spatial Visualization with ggplot2")
   (description
     "This package provides a collection of functions to visualize spatial data and models on top of static maps from various online sources (e.g Google Maps and Stamen Maps).  It includes tools common to those tasks, including functions for geolocation and routing.")
   (license gpl2)))

(define-public r-geosphere
  (package
   (name "r-geosphere")
   (version "1.5-5")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "geosphere" version))
       (sha256
         (base32
           "0vffppnyxp7ryg7rvsb1ww9z0ghh1vk20vzgw245pi2gfh9f0vwb"))))
   (build-system r-build-system)
   (propagated-inputs `(("r-sp" ,r-sp)))
   (home-page
     "http://cran.r-project.org/web/packages/geosphere")
   (synopsis "Spherical Trigonometry")
   (description
     "Spherical trigonometry for geographic applications.  That is, compute distances and related measures for angular (longitude/latitude) locations.")
   (license gpl3+)))

(define-public r-jpeg
  (package
   (name "r-jpeg")
   (version "0.1-8")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "jpeg" version))
       (sha256
         (base32
           "05hawv5qcb82ljc1l2nchx1wah8mq2k2kfkhpzyww554ngzbwcnh"))))
   (build-system r-build-system)
   (inputs `(("libjpeg" ,libjpeg)))
   (home-page "http://www.rforge.net/jpeg/")
   (synopsis "Read and write JPEG images")
   (description
     "This package provides an easy and simple way to read, write and display bitmap images stored in the JPEG format.  It can read and write both files and in-memory raw vectors.")
   (license #f)))

(define-public r-mapproj
  (package
   (name "r-mapproj")
   (version "1.2-5")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mapproj" version))
       (sha256
         (base32
           "0rjz37r4rizk2c6jaf54f0kfb60dqv6b262cnhiwjl55d4x6l0pk"))))
   (build-system r-build-system)
   (propagated-inputs `(("r-maps" ,r-maps)))
   (home-page
     "http://cran.r-project.org/web/packages/mapproj")
   (synopsis "Map Projections")
   (description
     "Converts latitude/longitude into projected coordinates.")
   (license #f)))

(define-public r-png
  (package
   (name "r-png")
   (version "0.1-7")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "png" version))
       (sha256
         (base32
           "0g2mcp55lvvpx4kd3mn225mpbxqcq73wy5qx8b4lyf04iybgysg2"))))
   (build-system r-build-system)
   (inputs `(("libpng" ,libpng)))
   (home-page "http://www.rforge.net/png/")
   (synopsis "Read and write PNG images")
   (description
     "This package provides an easy and simple way to read, write and display bitmap images stored in the PNG format.  It can read and write both files and in-memory raw vectors.")
   (license #f)))

(define-public r-rgooglemaps
  (package
   (name "r-rgooglemaps")
   (version "1.4.1")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RgoogleMaps" version))
       (sha256
         (base32
           "0fsmlnhl4kw2j4972kfanzw9njhnzk695gsyw8g6yppsmz2clcaq"))))
   (properties `((upstream-name . "RgoogleMaps")))
   (build-system r-build-system)
   (propagated-inputs `(("r-png" ,r-png)))
   (home-page
     "http://cran.r-project.org/web/packages/RgoogleMaps")
   (synopsis "Overlays on Static Maps")
   (description
     "Serves two purposes: (i) Provide a comfortable R interface to query the Google server for static maps, and (ii) Use the map as a background image to overlay plots within R.  This requires proper coordinate scaling.")
   (license (list gpl2+ gpl3+))))

(define-public r-sp
  (package
   (name "r-sp")
   (version "1.2-4")
   (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sp" version))
       (sha256
         (base32
           "0crba3j00mb2xv2yk60rpa57gn97xq4ql3a6p9cjzqjxzv2cknk2"))))
   (build-system r-build-system)
   (propagated-inputs `(("r-lattice" ,r-lattice)))
   (home-page
     "http://cran.r-project.org/web/packages/sp")
   (synopsis "Classes and Methods for Spatial Data")
   (description
     "Classes and methods for spatial data; the classes document where the spatial location information resides, for 2D or 3D data.  Utility functions are provided, e.g.  for plotting data as maps, spatial selection, as well as methods for retrieving coordinates, for subsetting, print, summary, etc.")
   (license gpl2+)))

(define-public r-feather
   (package
     (name "r-feather")
     (version "0.3.1")
     (source
       (origin
         (method url-fetch)
         (uri (cran-uri "feather" version))
         (sha256
           (base32
             "1q6dbkfnkpnabq8lb6bm9ma44cfcghx2lm23pyk3vg7943wrn1pi"))))
     (build-system r-build-system)
     (propagated-inputs
       `(("r-hms" ,r-hms)
         ("r-rcpp" ,r-rcpp)
         ("r-tibble" ,r-tibble)))
     (home-page "https://github.com/wesm/feather")
     (synopsis "R Bindings to the Feather 'API'")
     (description
       "Read and write feather files, a lightweight binary columnar data store designed for maximum speed.")
     (license asl2.0)))
