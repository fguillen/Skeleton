require "bundler/capistrano"

set :application, "skeleton"
set :scm, :git
set :repository,  "git@github.com:fguillen/Skeleton.git"
set :deploy_to, "/home/www/skeleton.fernandoguillen.info"
set :user, "fguillen"
set :group, "fguillen"
set :use_sudo, false

server "skeleton.fernandoguillen.info", :web, :app, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end