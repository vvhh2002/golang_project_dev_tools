echo "This Script create by Victor Ho"
echo "Now Let's create a new module!"

MODULE_NAME=""
# shellcheck disable=SC2157
while [ -z "MODULE_NAME" ]; do
  read -r -p "Enter New Module Name: " MODULE_NAME
  if [ -z "MODULE_NAME" ]
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
cp -R "${RUNDIR}"/template/ "${ROOTDIR}"/module_srcs/"${MODULE_NAME}"/