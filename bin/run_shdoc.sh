#/bin/bash

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
