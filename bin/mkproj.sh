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

echo "#!/bin/bash" >>  ${controldir}/commands
echo "cd ${workdir}" >> ${controldir}/commands

git init ${controldir}
echo "*.html" >> ${controldir}/.gitignore
git -C ${controldir} add -A
git -C ${controldir} commit -m "Initial commit"

ln -s ${controldir}/* ${workdir}
ln -s ${datadir} ${workdir}/data

echo 'Sys.setenv(WORKDIR = "/home/dricardo/work")' > ${workdir}/.Rprofile