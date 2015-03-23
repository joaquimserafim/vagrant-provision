#!/usr/bin/env bash

# URL's
URL="https://github.com/joaquimserafim/vagrant-provision-scripts/blob/master/scripts/"
RAW_URL="https://raw.githubusercontent.com/joaquimserafim/vagrant-provision-scripts/master/scripts/"

download() {
  if curl --output /dev/null --silent --head --fail "$HIT"; then
    curl -s "$HIT_RAW" | bash
  else
    echo "Warning: '$OP' doesn't exist in the provision scripts." >&2
  fi
}

check_curl_exist() {
  if ! CURL="$(type -ap "curl")" || [ -z "$CURL" ]; then
    echo "installing curl..."
    apt-get update > /dev/null 2>&1
    apt-get install -y curl > /dev/null 2>&1
  fi
}

prc() {
  OP=$1
  HIT="$URL$OP.sh"
  HIT_RAW="$RAW_URL$OP.sh"

  echo "running '$OP' script..."
  START=$(date +%s)
  download $OP $HIT $HIT_RAW
  END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo "'$OP' it took $DIFF seconds."
}

main() {
  check_curl_exist
  echo "processing provision..."
  for op in $OPS; do
    prc $op
  done
}

OPS=$@
main $OPS
