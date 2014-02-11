#!/bin/bash

. user_profile.sh
PROJECT=${PROJECT:-tmp}
TARGET_DIR=${TARGET_DIR:-`pwd`}
LANG_TYPE=${LANG_TYPE:-cpp}
CSCOPE_FILE_DIR=${CSCOPE_FILE_DIR-$HOMEDIR/cscope/$PROJECT}

if [ ! -d $CSCOPE_FILE_DIR ]; then
    mkdir -p $CSCOPE_FILE_DIR
fi


function gen_cscope() {
    suffix=$(python $HOMEDIR/bin/type_suffix_map.py --langtype $LANG_TYPE)
    find_name_pattern="find $TARGET_DIR"
    first=0
    for glob in ${suffix[@]}
    do
        if [ $first -eq 0 ]; then
            find_name_pattern="$find_name_pattern -name '*$glob'"
            first=1
        else
            find_name_pattern+=" -o -name '*$glob'"
        fi
    done

    (
    cd $HOMEDIR
    eval $find_name_pattern >$CSCOPE_FILE_DIR/cscope.files
    cd $CSCOPE_FILE_DIR
    cscope -b 2>1 1>/dev/null
    echo "CSCOPE_DB=$CSCOPE_FILE_DIR/cscope.out; export CSCOPE_DB"
    )
}

function usage() {
    echo "Usage:"
    echo "PROJECT=project_name LANG_TYPE=[cpp|py] gen_cscope.sh"
}


case "$1" in
    ?)
        usage
        ;;
    *)
        gen_cscope
        ;;
esac
