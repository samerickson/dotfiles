# Used to symlink files from one directory to another
#  first parameter should be source directory
#  second parameter should be destination directory
function symLink() {
    if [ -d "${1}" ]; then
        if [ -d "${2}" ]; then
            cd "${1}"
            for FILE in .*; do
                echo "ln -sfv ${HOME}/${1}/${FILE} ${HOME}/${2}/${FILE}"
            done
        else
            echo "\"${2}\" is not a valid directory"
        fi
    else
        echo "\"${1}\" is not a valid directory"
    fi
}
