#!/bin/bash
# @file run_shdoc
# @brief A helper to run shdoc and write its output to the correct .md file.
# @description
#  This tool runs shdoc either for single files or recursive directories
#  and writes the output to the correct .md file.
#  It is designed to be used with the index_parser.
#  Example:
#  ```
#  index_parser.sh a_dir_with_lists/ | xargs -l2 run_shdoc.sh
#  ```

BASE_PATH=$(realpath $(dirname ${0}))

[ -z "${1}" ] && exit 0
[ -z "${2}" ] && exit 0

SHDOC_PATH="${BASE_PATH}/../doc/shared/shdoc"
mkdir -p  "${SHDOC_PATH}"

if [ -d "${1}" ]
then
	find  ${1}/ -name "*.sh" \
	            -exec ${BASE_PATH}/shdoc/shdoc {} >> ${SHDOC_PATH}/${2} \;
	exit 0
fi

if [ -f "${1}" ]
then
	${BASE_PATH}/shdoc/shdoc ${1} >> ${SHDOC_PATH}/${2}
	exit 0
fi
