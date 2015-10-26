#https://docs.puppetlabs.com/pe/latest/nc_update_classes.html#post-v1update-classes

CONFDIR=$(puppet master --configprint confdir)

CERT=$(puppet master   --confdir ${CONFDIR} --configprint hostcert)
CACERT=$(puppet master --confdir ${CONFDIR} --configprint localcacert)
PRVKEY=$(puppet master --confdir ${CONFDIR} --configprint hostprivkey)
OPTIONS="--cert ${CERT} --cacert ${CACERT} --key ${PRVKEY}"
CONSOLE=$(awk '/server: /{print $NF}' ${CONFDIR}/classifier.yaml)

curl -k -X POST ${OPTIONS} "https://${CONSOLE}:4433/classifier-api/v1/update-classes"
