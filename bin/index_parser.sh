#!/bin/bash

BASE_PATH=$(realpath ${1})

print_path_lines() {
	cat ${1} | while read -r path
	do
		echo $(realpath ${BASE_PATH}/${path})
	done
}

for file in ${BASE_PATH}/*.list
do
	print_path_lines "${file}"
done
