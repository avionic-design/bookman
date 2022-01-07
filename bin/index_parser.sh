#!/bin/bash

SOURCES_PATH=$(realpath $(readlink -e ${1}))
BASE_PATH=$(realpath $(readlink -e ${SOURCES_PATH})/../../)

print_path_lines() {
	cat ${1} | while read -r path
	do
		echo $(realpath ${BASE_PATH}/${path})
		echo $(basename ${1}) | sed 's/[.]list/.md/g'
	done
}

for file in ${SOURCES_PATH}/*.list
do
	print_path_lines "${file}"
done
