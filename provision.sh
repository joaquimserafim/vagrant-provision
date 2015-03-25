#!/usr/bin/env bash

USE_LOCAL_SCRIPTS=false

# URL's
URL="https://github.com/joaquimserafim/vagrant-provision-scripts/\
blob/master/scripts/"
RAW_URL="https://raw.githubusercontent.com/joaquimserafim/\
vagrant-provision-scripts/master/scripts/"

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
  echo "running '$OP' script..."
  START=$(date +%s)

  if [ -d "$USE_LOCAL_SCRIPTS" ]; then
    bash "$USE_LOCAL_SCRIPTS/$OP.sh"
  else
    HIT="$URL$OP.sh"
    HIT_RAW="$RAW_URL$OP.sh"
    download $OP $HIT $HIT_RAW
  fi

  END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo "'$OP' it took $DIFF seconds."
}

main() {
  echo "processing provision..."
  if [ "$#" -ne 1 ]; then
    echo "will run the following script(s): '"${@:2}"'"
  fi
  USE_LOCAL_SCRIPTS=$1
  check_curl_exist
  for op in "${@:2}"; do
    prc $op
  done
}

main $@
