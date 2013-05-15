# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias apptest='bundle exec rake db:drop:all; bundle exec rake db:create:all; bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate; bundle exec rspec spec'

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

current_git_branch(){
  parse_git_branch | sed -e 's/→//' -e 's/^[ \t]*//'
}

export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\] '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

if [ -f ~/.bash_tab ]; then
alias tab="source ~/.bash_tab"
fi


alias git_log="git log  > ~/log/git_log; head -20 ~/log/git_log"
alias git_diff="git diff > ~/log/git_diff ; cat ~/log/git_diff"

alias rails_ts="bundle exec rake ts:rebuild; rails s"
alias git_create="git config branch.$(current_git_branch).remote origin; git config branch.$(current_git_branch).merge refs/heads/$(current_git_branch);git commit -a;git push origin $(current_git_branch);cat .git/config"

alias git_create_info='echo -ne "git config branch.newbranch.remote origin \n git config branch.newbranch.merge refs/heads/newbranch \n git commit -a \n git push origin newbranch \n"'

alias git_delete_info='echo -ne "git checkout anotherbranch
git branch -r -d origin/newbranch
git branch -r
git branch -D newbranch
git branch -l\n"'

alias myaudio="alsamixer"
alias terminal="gnome-terminal"
alias rails_partials="tail -f log/development.log | egrep 'Rendering|Rendered|Completed'"

alias screenshots='echo -ne "
defaults write com.apple.screencapture location ~/Pictures/Screenshots/
killall SystemUIServer
\n"'

## To reload/update 
## source ~/.bash_profile

## iOS Application Quick Setup
alias set_test_env="cp ~/sample/Environments.plist.test  Project/Environments.plist"
alias set_staging_env="cp ~/sample/Environments.plist.staging  Project/Environments.plist"
alias open_iapp="open Project.xcodeproj/"
alias reset_local_env="git co Project/Environments.plist"
alias set_local_env="cp ~/sample/Environments.plist Project/Environments.plist"


## Rails work environment Quick Setup 
alias console="vim ~/log/console.log"
alias grep_info="echo -ne '\n\n grep -r hello | grep -v log | grep -v test | grep -v spec | grep -v db\n\n'"
alias apptest="bundle install --without abc; RAILS_ENV=test bundle exec rake db:drop; RAILS_ENV=test bundle exec rake db:create; bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate; bundle exec rake db:test:prepare; bundle exec rake test; bundle exec rspec spec;"

alias breakline="echo -ne '\n\n\n\n================================================================\n\n\n\n'"
alias rspec_f="rspec --format nested"
 
alias appconflict=" grep -r '<<<<<<<' * & grep -r '=======' * & grep -r '>>>>>>>' * | grep -v log "
alias myrails="bundle exec rake ts:rebuild; gnome-open http://0.0.0.0:3000; rails s"
alias git_push="apptest;
git config branch.$(current_git_branch).remote origin; 
git config branch.$(current_git_branch).merge refs/heads/$(current_git_branch);
git commit -a;
git push origin $(current_git_branch);
cat .git/config"


###################################
# GIT 
###################################
alias git_create_info="echo -ne 'git config branch.$(current_git_branch).remote origin
git config branch.$(current_git_branch).merge refs/heads/$(current_git_branch)
git commit -a
git push origin $(current_git_branch)
'"

alias git_delete_info='echo -ne "git checkout branchY
git branch -r -d origin/branchX
git branch -r
git branch -D branchX
git branch -l
git push origin :branchX
"'

alias git_info="echo -ne 'GIT PICKING FROM ONE BRANCH TO ANOTHER 
git cherry-pick [BINARY CODE]\n
GIT DELETE LAST COMMIT (LOCAL)
git reset --soft HEAD~1 \n
GIT RESET CHANGES IN FILES BEFORE COMMIT
git reset HEAD [FILE] 
rm -rf [FILE]
git co [FILE] \n
GIT DELETE LAST PUSH (REMOTE)
git push -f origin HEAD^:[BRANCH] \n
GIT DELETE SPECIFIED PUSH (REMOTE)
git rebase -i HEAD~2 
git push origin +[BRANCH]
git rebase --abort
\n
GIT MERGE
git merge --no-ff [BRANCH]
\n
GIT REMOVE MERGE
git reset --HARD
\n
GIT ABORT
git merge --abort

GIT ASKING PASSWORD AGAIN 
\n
change url in vim .git/config - which is supposed to be git@github.com.... rather than https://github.com....
[remote \"origin\"]
  fetch = +refs/heads/*:refs/remotes/origin/*
  url = git@github.com:andrewsage/breaking-the-cycle-server.git
'"


alias ssh_info="ssh bob@bob.com"
alias mysqldump_info="echo -ne '
#On Database Server \n
ssh root@xx.xxx.xxx.xx \n 
mysqldump -u root -p project_production > project.db \n
gzip project.db \n
pwd
#On your local machine \n
scp user@xx.xx.xx.xx:/home/db/project.db.gz .\n'; echo -ne 'gunzip < project.db.gz | mysql -u root project_development \n\n'"

alias mysql_info="mysql -uroot project"

###########################################################
# Resque
###########################################################
alias resque_info="echo -ne 'redis-server /etc/redis.conf
RAILS_ENV=live_development bundle exec rails s
resque-web
RAILS_ENV=live_development QUEUE=* bundle exec rake environment resque:work --trace
RAILS_ENV=live_development bundle exec rake resque:scheduler
'"
#########################################################
# Migration
#########################################################
alias migration_info="echo -ne 'RAILS_ENV=staging bundle exec rake db:drop ; RAILS_ENV=staging bundle exec rake db:create; RAILS_ENV=staging bundle exec rake db:migrate ; RAILS_ENV=staging bundle exec rake db:seed
'"
#########################################################
# Log Info
#########################################################
alias log_info="echo -ne '
log = Logger.new(\"/Users/bob/rails_apps/ltepic/log/debug.log\")
log.info(\"Hi.....\"*100)
'"

# Mac
# alias mate="open -a TextMate"

##########################################################
# Rails Info
#########################################################
alias rails_info="echo -ne '
bundle exec rake assets:precompile
bundle exec rails g rspec:model foo/bar
bundle exec rails g rspec:controller foo/bar/foo
bundle exec rails g
RAILS_ENV=staging bundle exec rails s
RAILS_ENV=test bundle exec rake db:drop; RAILS_ENV=test bundle exec rake db:create; RAILS_ENV=test bundle exec rake db:migrate
bundle exec rake db:drop; bundle exec rake db:create; bundle exec rake db:migrate


RAILS_ENV=test bundle exec rake db:drop; RAILS_ENV=test bundle exec rake db:create; RAILS_ENV=test bundle exec rake db:migrate
rake -T
rake task
namespace :foo do
 task :bar => :environment do
 end
end

Staging server

bundle exec rake db:drop RAILS_ENV=staging
bundle exec rake db:create RAILS_ENV=staging
mysql -uroot staging -p < development_db.sql
bundle exec rake db:migrate RAILS_ENV=staging

'"

##########################################################
# Rspec Info
#########################################################
alias rspec_info="echo -ne '
bundle exec rails g rspec:model foo/bar
bundle exec rails g rspec:model foo --dir=factories
bundle exec rails g rspec:controller foo/bar/foo
'"


##########################################################
# Rake Info
#########################################################
alias rake_info="echo -ne '
rake -T
rake -T | grep backup
rake routes
rake routes | grep home
rake erd
rake test
'"


##########################################################
# Unit Test Info
#########################################################
alias unit_test_info="echo -ne '
rake test
rake test:units
rake test:functionals
rake test:integration
rake test TEST=test/unit/project_test.rb
ruby -I\"lib:test\" path_to_test_file
ruby -I\"lib:test\" test/unit/project_test.rb -n test_should_create_project
ruby -I\"lib:test\" test/unit/project_test.rb -n /.*index.*/
'"

######################################################
# Nginx Info
######################################################
alias nginx_info="echo -ne '
sudo nginx -s stop && sudo nginx
passenger start
restart nginx
sudo kill -HUP \`cat  /opt/nginx/logs/nginx.pid\`
'"

######################################################
# Network Info
######################################################
alias network_info="echo -ne '
ifconfig
sudo ifconfig en0 down
sudo ifconfig en0 up
sudo ifconfig en1 down
sudo ifconfig en1 up

*check host ip address
ipconfig getpacket en0
ipconfig getpacket en1

*bandwidth limiting
sudo ipfw pipe 1 config bw 10KByte/s
sudo ipfw flush
'"
alias wifi_scan="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"

######################################################
# RVM Info
######################################################
alias rvm_info="echo -ne '
rvm install ruby-1.9.2-p180
If failed:
curl -L get.rvm.io | bash -s stable
rvm list
rvm info
'"


######################################################
# Free Memory Info
######################################################
alias mem_info="echo -ne '
free -m
ps aux | awk '{print $2, $4, $11}' | sort -k2rn | head -n 20
ps -A --sort -rss -o comm,pmem | head -n 11
top -b -n 1
ps auxf
'"
