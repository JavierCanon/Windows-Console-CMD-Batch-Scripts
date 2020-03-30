
function pause(){
    read -p "$*"
}


## Create a NEW repository and download files from GitLab ##
#__________________________________________________________#

# step 1: navigate to working directory
	cd ~/Documents/projects/crs
	
# step 2: initialize a git repo
	git init

# step 3: define a gitlab repo
	git remote add origin git@gitlab.ext.rdte.afrl.af.mil:stinnejm/conf_room_sched.git

# step 4: download all files from gitlab repo to local folder
	git pull origin master


## Upload changes to GitLab repo ##
#__________________________________________________________#

# step 1: summary of which files have changes
	git status

# step 2: verify you are working with the correct remote repo
	git remote -v

# step 3: add changes


git status
git remote -v
# git pull git@gitlab.ext.rdte.afrl.af.mil:cherocas/itnss.git
# git pull git@gitlab.ext.rdte.afrl.af.mil:rowejp/conference_room_scheduler.git
git add .
git ls-files --others -i --exclude-standard # list all ignored files
git status
# git push --set-upstream git@gitlab.ext.rdte.afrl.af.mil:cherocas/itnss.git master
git push --set-upstream git@gitlab.ext.rdte.afrl.af.mil:cherocas/crs.git master
git commit
git push git@gitlab.ext.rdte.afrl.af.mil:cherocas/itnss.git
pause 'Prese [Enter] to continue...'
#  git pull git@gitlab.ext.rdte.afrl.af.mil:stinnejm/conf_room_sched.git master

# get a single file from GitLab
git fetch
git checkout 


#git config --get remote.origin.url # To display the URL of origin