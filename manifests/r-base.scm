(packages->manifest
 (map (compose list specification->package+output)
      '("r-minimal" "r-base64enc" "r-jsonlite" "r-plotly" "feather")))
