#!/bin/bash

# mktemplate - generate multiple template files

if [ "${1}" == "" ]; then
    echo "Usage: mkproj.sh [handle]"
    exit
fi

controldir="/$HOME/control/${1}"
workdir="$HOME/work/${1}"
datadir="$HOME/projects_data/${1}"

if [ -d "${controldir}" -o -d "${workdir}" -o -d "${datadir}" ]; then
    echo -e "\nOne or more of the directories below already exist:"
    echo -e "${controldir}\n${workdir}\n${datadir}\n"
    exit
fi

mkdir -p ${controldir} ${workdir} ${datadir}
mkdir -p ${controldir}/{src,notebooks,scripts}
mkdir -p ${controldir}/src/envs/scripts
touch ${controldir}/commands

ln -s ${controldir}/* ${workdir}
ln -s ${datadir} ${workdir}/data
