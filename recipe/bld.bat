cd %SRC_DIR%

set "CC=cl"
set "CXX=cl"
set "CFLAGS=/MD"
set "CXXFLAGS=/MD"
set "LD=link"


bash -lc "./configure --enable-msvc --prefix=%LIBRARY_PREFIX% --exec-prefix=%LIBRARY_PREFIX% --with-blas-lib='-L${PREFIX}/lib -lblas' --with-lapack-lib='-L${PREFIX}/lib -llapack'"
bash -lc "make -j%CPU_COUNT%"
bash -lc "make install"
