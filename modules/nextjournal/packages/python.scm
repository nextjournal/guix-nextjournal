(define-module (nextjournal packages python)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python))

(define-public python-feather-format
  (package
    (name "python-feather-format")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "feather-format" version))
        (sha256
          (base32
            "1adivm5w5ji4qv7hq7942vqlk8l2wgw87bdlsia771z14z3zp857"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-pandas>=0.17.0" ,python-pandas),
        ("python-arrow", python-arrow)))



    (home-page "http://github.com/wesm/feather")
    (synopsis
      "Simple wrapper library to the Apache Arrow-based Feather File Format")
    (description
      "Simple wrapper library to the Apache Arrow-based Feather File Format")
    (license asl2.0)))
