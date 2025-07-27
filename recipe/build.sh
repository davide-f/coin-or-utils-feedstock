#!/usr/bin/env bash

set -e


cp $BUILD_PREFIX/share/gnuconfig/config.* ./CoinUtils 
cp $BUILD_PREFIX/share/gnuconfig/config.* .

BLAS_LIB=( --with-blas-lib='-L${PREFIX}/lib -lblas' )
LAPACK_LIB=( --with-lapack-lib='-L${PREFIX}/lib -llapack' )
EXTRA_FLAGS=()

./configure \
  --prefix="${$PREFIX}" \
  --exec-prefix="${$PREFIX}" \
  "${BLAS_LIB[@]}" \
  "${LAPACK_LIB[@]}" \
  "${EXTRA_FLAGS[@]}" || cat CoinUtils/config.log

make -j "${CPU_COUNT}"

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  make test
fi

make install
