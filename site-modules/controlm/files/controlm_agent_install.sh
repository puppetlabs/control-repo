#!/bin/bash
  cd /apps/bmc/
  sudo -u ctmagent /apps/bmc/software/version_9/setup.sh -silent /apps/bmc/ctm/ctm_silentinstall_optus.xml 
  RESULT=$?
  echo "exit status $RESULT"
  /bin/date > /apps/bmc/ctm/controlm_agent_install.hasrun
  echo "exit status $RESULT" >> /apps/bmc/ctm/controlm_agent_install.hasrun
  echo "do not remove this file unless you want to rerun the install" >> /apps/bmc/ctm/controlm_agent_install.hasrun
  chmod 444  /apps/bmc/ctm/controlm_agent_install.hasrun
  exit $RESULT

