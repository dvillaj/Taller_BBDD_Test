#!/bin/bash
ENVIRONMENT=dev
if [ -n "$1" ]; then
    ENVIRONMENT="$1"
fi

source "$_base/$ENVIRONMENT/jupyter/run-env.sh"
if [ -n "$2" ]; then
    IPYNB_FILE="$2"
fi
if [ -n "$3" ]; then
    CONVERT_KERNEL="$3"
fi

jupyter nbconvert --to html --ExecutePreprocessor.kernel_name=$CONVERT_KERNEL --ExecutePreprocessor.timeout=-1 --execute $CONVERT_INPUT_PATH/$IPYNB_FILE --output $CONVERT_OUTPUT_PATH/$IPYNB_FILE.html