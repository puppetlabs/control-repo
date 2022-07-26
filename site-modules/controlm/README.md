This installs the Optus standard controlm.

All hiera is managed in the approproate pp file under manifests and the various child .pp files use inherit to see the variables.

# CONTROLM AGENT
All hiera has defaults.  You will probably only need to set servers if anything.

## Software and patches
The install script installs the main software and the patches as I couldn't get the patch script to run properly after the main install script.  Patches are defaulted to the current ones or set in heira
    controlm::controlm_agent::patch_files:
       - file1
       - file2


## Servers
if the client is in a different domain to the server (eg client is nix.au.singtelgroup.net and server is optus.com.au) then need FQDN as below, else can use short form in both
```
  controlm::controlm_agent::primary_server_host: ctmgnpappla012.optus.com.au
  controlm::controlm_agent::server_host: ctmgnpappla012
```
Note that you need to be able to contact the host[s] on the server2agent port listed in controlm_agent.pp for the install to work.

All DEV (DEV,PPT, SIT, GNP etc) must use ctmgnpappla012 as the control-m server, all PRD non BCC Agents must use ctmprdappla003.


## Admins
You need accounts for the admins and schedulers as below, subbing PRD for GNP in prd:
```
 isnd_linux::profiles::soe::login_accounts::groups:
    - 'ocaus01\ACL-GNP-CTRLM-rwx-SMT-ADMIN':
      additional_groups:
        - controlm
    - 'ocaus01\ACL-GNP-CTRLM-rx-SMT-SCHED':
      additional_groups:
        - controlm

  tpiam::profiles::sudoers:
    ocaus01aclgnpctrlmrwxsmtadmin:
      runas_users:
        - ctmagent
      commands: all_commands
    ocaus01aclgnpctrlmrxsmtsched:
      runas_users:
        - ctmagent
      commands: all_commands include controlm::controlm_agent::users

```
## To reinstall
```
 userdel -r ctmagent
 yum remove ctmagent_core_clean
 rm -rf /apps/bmc
```
# ctm.sh fails
If puppet complains about ctm.sh, be sure everything is running as root properly.  The install should do this, but exec is never reliable
```
[root@bdpprdedgla001 scripts_optus]# pwd
/apps/bmc/ctm/scripts_optus
[root@bdpprdedgla001 scripts_optus]# ./ctm.sh stop
Stopping Control-M Agent
Killing Control-M/Agent Listener pid:23639
2018-01-09 11:06:33 Listener process stopped
Killing Control-M/Agent Tracker pid:23693
2018-01-09 11:06:34 Tracker process stopped
```
it might complain, so if it does, do as it says:
```
[root@bdpprdedgla002 scripts_optus]# ./ctm.sh stop
Stopping Control-M Agent
The agent is currently running as 'ctmagent'
You need to login as 'ctmagent' and run this command again
```
so su - ctmagent, run the stop command and then as root
```
[root@bdpprdedgla001 scripts_optus]# ./ctm.sh mode_full
 Sudo mode is disabled

/apps/bmc/ctm/exe/vault/su_bmc ownership set to ctmagent
/apps/bmc/ctm/exe/vault/su_bmc setuid bit was reset
/apps/bmc/ctm/sysout permissions set to 755 without sticky bit
/apps/bmc/ctm/sysout setgid bit was reset
/apps/bmc/ctm/non-root deleted

 Non-root mode was disabled.

[root@bdpprdedgla001 scripts_optus]# ./ctm.sh start


Starting the agent as 'root' user

Control-M/Agent Listener started. pid: 10838
Control-M/Agent Tracker started. pid: 10892

Control-M/Agent started successfully.
Control-M Agent Started
```
