SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
$SCRIPTPATH/kubectl.sh
$SCRIPTPATH/velero.sh