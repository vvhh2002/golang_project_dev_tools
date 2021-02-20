
PROJECT_NAME=${PWD##*/}

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
ROOTDIR="$( cd -P "$( dirname "$RUNDIR/.././" )" >/dev/null 2>&1 && pwd )"
echo "This is golang develop project new module tools"
echo "script run at ${RUNDIR}"
echo "project root at ${ROOTDIR}"
echo "This Script create by Victor Ho"
echo "Now Let's create a new module!"

MODULE_NAME=""
# shellcheck disable=SC2157
while [ -z "$MODULE_NAME" ]; do
  read -r -p "Enter New Module Name: " MODULE_NAME
  if [ -z "$MODULE_NAME" ]
  then
    echo "Name is Empty please ReEnter it."
    sleep 1
    continue
  fi
  #check folder
  if [ -d "${ROOTDIR}/${MODULE_NAME}" ]
  then
     echo "you already build this board, please ReEnter it."
     MODULE_NAME=""
     sleep 1
  else
    MODULE_NAME=${MODULE_NAME//" "/"_"}
    MODULE_NAME=${MODULE_NAME//"."/"_"}
    read -p "Are you sure module Name is:${MODULE_NAME} [y/n]? " -n 1 -r REPLY
    echo    # (optional) move to a new line
    case ${REPLY} in
        [Yy]* ) break;;
        [Nn]* ) echo "Please think it again.";exit;;
        * ) echo "Please answer yes or no."; exit;
    esac
  fi
done


mkdir -p "${ROOTDIR}/module_srcs/${MODULE_NAME}"
mkdir -p "${ROOTDIR}/module_srcs/${MODULE_NAME}/main"
mkdir -p "${ROOTDIR}/module_srcs/${MODULE_NAME}/test"
mkdir -p "${ROOTDIR}/module_srcs/${MODULE_NAME}/cmd"
mkdir -p "${ROOTDIR}/module_srcs/${MODULE_NAME}/test"
cd "${ROOTDIR}/module_srcs/${MODULE_NAME}" || exit
go mod init "github.com/vvhh2002/${MODULE_NAME}"
cp -R "${RUNDIR}"/template/ "${ROOTDIR}"/module_srcs/"${MODULE_NAME}"/

echo "All ok!"
echo "Now Let's rock!"
