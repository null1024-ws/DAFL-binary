#!/bin/bash
set -e

##
# Pre-requirements:
# - env DAFL_SELECTIVE_COV: path to instr score for dafl
# - env DAFL_DFG_SCORE: path to dfg score for dafl
# - env FUZZER: path to fuzzer work dir
# - env TARGET: path to target work dir
# - env MAGMA: path to Magma support files
# - env OUT: path to directory where artifacts are stored
# - env CFLAGS and CXXFLAGS must be set to link against Magma instrumentation
##

export CC="$FUZZER/repo/afl-clang-fast"
export CXX="$FUZZER/repo/afl-clang-fast++"
export AS="$FUZZER/repo/afl-as"

export LIBS="$LIBS -l:afl_driver.o -lstdc++"

# check the  DAFL_DFG_SCORE and DAFL_SELECTIVE_COV
if [ -z $DAFL_DFG_SCORE ] || [ -z $DAFL_SELECTIVE_COV ]; then
    echo '$DAFL_DFG_SCORE and $DAFL_SELECTIVE_COV must be specified as environment variables.'
    exit 1
fi

echo "DAFL_DFG_SCORE is"$DAFL_DFG_SCORE
echo "DAFL_SELECTIVE_COV is"$DAFL_SELECTIVE_COV


"$MAGMA/build.sh"
"$TARGET/build.sh"