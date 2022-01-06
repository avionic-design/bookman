#/bin/bash

BASE_PATH=$(realpath $(dirname ${0}))

find  ${1}/ -name "*.sh" -exec ${BASE_PATH}/shdoc/shdoc {} >> ${BASE_PATH}/../doc/shared/sources.md \;
