SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
$SCRIPTPATH/helm.sh
$SCRIPTPATH/kubectl.sh
$SCRIPTPATH/velero.sh