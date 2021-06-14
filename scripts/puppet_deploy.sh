#!/bin/bash
set -u

export PATH="/opt/puppetlabs/bin:$PATH"
# Allow these environment variable to be overriden
: ${URL:='https://puppet:8170/code-manager'}
# CI_BUILD_REF_NAME is a variable set by gitlab
: ${ENVIRONMENT:="$CI_BUILD_REF_NAME"}

err() {
  echo "$1" >&2
}

if [ -z "${PUPPET_TOKEN:-}" ]; then
  err "ERROR: PUPPET_TOKEN environment variable must be set!"
  err "SUGGESTION: Did you push to origin instead of upstream?"
  err "PUPPET_TOKEN must be set as an environment variable in CI"
  exit 1
fi

if ! [ -x /opt/puppetlabs/bin/puppet-code ]; then
    err "ERROR: /opt/puppetlabs/bin/puppet-code does not exist"
    err "SUGGESTION: Install the puppet client tools"
    err "https://docs.puppet.com/pe/2016.4/install_pe_client_tools.html#install-on-a-linux-workstation"
    exit 2
fi

# Save the token to a temporary file so we can use it with puppet code deploy
scratch="$(mktemp -d)"
remove_scratch() {
  [ -e "${scratch:-}" ] && rm -rf "$scratch"
}
trap remove_scratch EXIT
# Subsequent calls to mktemp should be inside our scratch dir
export TMPDIR="$scratch"

tokenfile="$(mktemp)"
echo -n "$PUPPET_TOKEN" > "$tokenfile"

# Turn on debug logging after the token has been written to the file system
set -x
# Deploy the code
puppet-code deploy \
  --service-url "$URL" \
  --token-file "$tokenfile" \
  --wait "${ENVIRONMENT}"
rval=$?
set +x

if [ $rval -ne 0 ]; then
  echo "ERROR: puppet-code deploy failed with exit code $rval" >&2
  exit $rval
fi

echo "Exiting with exit value $rval"
exit $rval

# vim:tabstop=2
# vim:shiftwidth=2
# vim:expandtab
