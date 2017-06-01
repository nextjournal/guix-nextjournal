;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015, 2016, 2017 Ricardo Wurmus <ricardo.wurmus@mdc-berlin.de>
;;;
;;; This file is NOT part of GNU Guix, but is supposed to be used with GNU
;;; Guix and thus has the same license.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (nextjournal packages staging)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)

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
  (license gpl2))
