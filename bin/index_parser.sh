#!/bin/bash
# @file index_parser
# @brief A parser that parses .list files.
# @description
#  A parser that parses .list files.
#  It outputs writes the resolved absolut path in ervery line of
#  the .list file and the target .md file seperated by a new line
#  to stdout.

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
