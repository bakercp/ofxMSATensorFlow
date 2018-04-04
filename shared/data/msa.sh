#!/usr/bin/env bash

THIS_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
THIS_NAME=$(basename "${BASH_SOURCE[0]%.*}")
INSTALL_PATH=${THIS_PATH}/${THIS_NAME}
mkdir -p ${INSTALL_PATH}

echo "Installing ${THIS_NAME} data ..."

INSTALL_PATH=${INSTALL_PATH}/examples
mkdir -p ${INSTALL_PATH}
# BASE_URL="http://dlib.net/files"
# BASE_URL=https://github.com/davisking/dlib-models/raw/master/"
BASE_URL="https://github.com/memo/ofxMSATensorFlow/releases/download/examples/"
FILES=(
  "example-char-rnn-data"
  "example-handwriting-rnn-data"
  "example-inception3-data"
  "example-mnist-data"
  "example-pix2pix-data"
  "example-style-transfer-data"
)

for file in "${FILES[@]}"
do
  if ! [ -d ${INSTALL_PATH}/${file} ]; then
    echo "Downloading ${file}.tar.gz"
    mkdir -p ${INSTALL_PATH}/${file}
    cd  ${INSTALL_PATH}/${file}
    curl -LO --progress-bar ${BASE_URL}/${file}.tar.gz
    tar xf ${file}.tar.gz
    rm ${file}.tar.gz
    cd -
  fi
  echo "✅ ${INSTALL_PATH}/${file}"
done
