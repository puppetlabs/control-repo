# GitLab

1. Install Gitlab
 - https://about.gitlab.com/downloads/

2. After Gitlab is installed you may sign if with the `root` user and password `5iveL!fe`

3. Make a user for yourself

4.  Make an ssh key to link with your user.  You’ll want to do this on the machine you intend to edit code from ( most likely not your puppet master but your local workstation / laptop )
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/

5.  Create a group called `puppet` ( this is case sensitive )
 - http://doc.gitlab.com/ce/workflow/groups.html

6. Create a user called `r10k_api_user` and add them to the `puppet` group
 - From the landing page, select groups
 - Choose the puppet group
 - In the left hand pane, select memembers
 - Add the `r10k_api_user` with `master` permissions

7. Add your user to the `puppet` group as well

8. Create a project called `control-repo` and set the Namespace to be the `puppet` group

9.  Logout of root and login as the `r10k_api_user`
 - Go to profile settings -> account ( https://<your_gitlab_server>/profile/account )
 - Copy the api token

10. Clone this control repository to your laptop/workstation
 - `git clone <repository url>`
 - `cd control-repo`

11. `git mv hieradata/nodes/example-puppet-master.yaml hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`
 - Open `hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`
     - edit `gms_api_token` to be your api token
     - edit `git_management_system` to be 'gitlab'
     - edit the `gms_server_url`

12. `git add hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`

13. `git commit -m "renaming example-puppet-master.yaml"`

14. Rename my repository as the upstream remote
 - `git remote rename origin upstream`

15. Add your internal repository as the origin remote
 - `git remote add origin <url of your gitlab repository>`

16.  Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

17. `git branch --set-upstream-to origin/production`
