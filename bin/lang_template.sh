#!/bin/bash
# A language small cases templating script

LANG_TYPE=${LANG_TYPE:-"py"}
fname=${1-"test"}

declare -A suffix_map

suffix_map[py]=py
suffix_map[cpp]=cc

declare -A template_fnamemap
template_fnamemap[py]=python_template.${suffix_map[py]}
template_fnamemap[cpp]=cc_template.${suffix_map[cpp]}

function usage()
{
    echo "Usage:(Gen a template)"
    echo "[LANG_TYPE=[cpp/py] lang_type.sh [fname]"
}

if [ -e $fname ]
then
    echo $fname" exists. Specify another filename"
    exit 1
fi

if [ ${template_fnamemap[$LANG_TYPE]} ]
then
    cp ~/bin/${template_fnamemap[$LANG_TYPE]} $fname.${suffix_map[$LANG_TYPE]}
else
    echo "LANG_TYPE '"$LANG_TYPE"' is not right."
    exit 1
fi

