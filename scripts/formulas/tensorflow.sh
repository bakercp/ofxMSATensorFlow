#! /bin/bash
#
# TensorFlow
#
# uses bazel, makefiles etc.

# define the version
VER=1.7.0

# tools for git use
GIT_URL="https://github.com/tensorflow/tensorflow.git"
GIT_TAG="v$VER"

FORMULA_TYPES=( "osx" "linux64")

# download the source code and unpack it into LIB_NAME
function download() {
    #git clone --depth=1 --branch=$GIT_TAG https://github.com/tensorflow/tensorflow.git
    mkdir tensorflow
    cd tensorflow
    if [ "$TYPE" == "osx" ] ; then
      curl -OL https://github.com/memo/ofxMSATensorFlow/releases/download/tf1.0/lib_TF1.0_osx_OPT_CPU_2017_03_01.zip
      unzip lib_TF1.0_osx_OPT_CPU_2017_03_01.zip
    elif [ "$TYPE" == "linux64" ] ; then
      curl -OL https://github.com/memo/ofxMSATensorFlow/releases/download/tf1.0/lib_TF1.0_linux64_OPT_CUDA8.0_CUDNN5.1_2017_02_22.tar.gz
      tar xvf lib_TF1.0_linux64_OPT_CUDA8.0_CUDNN5.1_2017_02_22.tar.gz
    fi
    cd -
}

# prepare the build environment, executed inside the lib src dir
function prepare() {
  echo "Nothing to prepare."
}

# executed inside the lib src dir
function build() {
  echo "Nothing to build."

    # if [ "$TYPE" == "osx" ] || [ "$TYPE" == "linux64" ] ; then
    #     export MAKEFLAGS="-j$PARALLEL_MAKE -s"
    #     if [ "$TYPE" == "osx" ] ; then
    #       bazel build \
    #       --config=opt \
    #       --config=monolithic \
    #       //tensorflow:libtensorflow_cc.so
    #     else
    #       bazel build \
    #       --config=opt \
    #       --config=monolithic \
    #       --config=cuda \
    #       //tensorflow:libtensorflow_cc.so
    #     fi
    #
    # fi
}

# executed inside the lib src dir, first arg $1 is the dest libs dir root
function copy() {
  # Make a copy of the lib in the addon directoy.
  mkdir -p $1/lib/$TYPE
  cp ${BUILD_DIR}/tensorflow/libtensorflow_cc.so $1/lib/$TYPE/

  # Make a copy of the lib in the lib directory.
  mkdir -p ~/lib/
  cp ${BUILD_DIR}/tensorflow/libtensorflow_cc.so
}

# executed inside the lib src dir
function clean() {
  echo "Nothing to clean."
}
