require "bundler/capistrano"

set :application, "skeleton"
set :scm, :git
set :repository,  "git@github.com:fguillen/Skeleton.git"
set :branch, "master"
set :deploy_to, "/home/www/skeleton.fernandoguillen.info"
set :user, "fguillen"
set :group, "fguillen"
set :use_sudo, false

server "skeleton.fernandoguillen.info", :web, :app, :db, :primary => true

after "deploy:update_code", "customs:symlink"
after "deploy", "deploy:cleanup"

namespace :customs do
  task :symlink, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/system/database.yml #{current_release}/config/database.yml &&
      ln -nfs #{shared_path}/system/app_config.yml #{current_release}/config/app_config.yml &&
      ln -nfs #{shared_path}/system/uploads #{current_release}/public/assets/uploads &&
      ln -nfs #{shared_path}/system/production.sqlite3 #{current_release}/db/production.sqlite3
    CMD
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app do
    run "touch #{File.join("#{current_release}/tmp/restart.txt")}"
  end
end