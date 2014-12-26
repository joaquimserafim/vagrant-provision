#!/bin/bash

# URL's
URL="https://github.com/joaquimserafim/vagrant-provision-scripts/blob/master/scripts/"
RAW_URL="https://raw.githubusercontent.com/joaquimserafim/vagrant-provision-scripts/master/scripts/"

has() {
  type "$1" > /dev/null 2>&1
}

use_curl() {
  if curl --output /dev/null --silent --head --fail "$HIT"; then
    curl -s "$HIT_RAW" | bash
  else
    echo "Warning: '$OP' doesn't exist in the provision scripts." >&2
  fi
}

use_wget() {
  echo "'wget' not implemented yet!" >&2
  exit 1
}

prc() {
  OP=$1
  HIT="$URL$OP.sh"
  HIT_RAW="$RAW_URL$OP.sh"

  echo "run $OP..."
  START=$(date +%s)

  if has "curl"; then
    use_curl $OP $HIT $HIT_RAW
  elif has "wget"; then
    use_wget $OP $HIT $HIT_RAW
  fi

  END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo "it took $DIFF seconds."
}

main() {
  echo "processing provision..."
  for op in $OPS; do
    prc $op
  done
}

OPS=$@
main $OPS
