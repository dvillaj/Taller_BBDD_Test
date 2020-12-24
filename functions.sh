function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }

function execute_notebook {
    NOTEBOOK=$1
    IFS='/' read -r -a ARRAY <<< "$NOTEBOOK"
    LEN=`expr ${#ARRAY[@]} - 1`
    
    HOME_OUTPUT=`join_by / "${ARRAY[@]:0:$LEN}"`
    HOME_OUTPUT="./html/${HOME_OUTPUT:1}"
    
    jupyter nbconvert --ExecutePreprocessor.timeout=-1 --execute --output-dir=$HOME_OUTPUT --to html_embed "$NOTEBOOK"
    if [ $? -eq 0 ]; then
        jupyter nbconvert --clear-output --inplace "$NOTEBOOK"
    fi
}

: '
NOTEBOOK="../Taller_BBDD_Practica/dff/Caso de Uso.ipynb"
IFS='/' read -r -a ARRAY <<< "$NOTEBOOK"
LEN=`expr ${#ARRAY[@]} - 1`
    
echo "${ARRAY[@]}"
    
DIRECTORY=`join_by / "${ARRAY[@]:0:$LEN}"`
HOME_OUTPUT="${DIRECTORY:1}"

echo $DIRECTORY
echo $HOME_OUTPUT
'

