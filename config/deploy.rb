# require "bundler/capistrano"

set :rbenv_ruby, File.read('.ruby-version').strip
set :ssh_options, { :forward_agent => false, :user => "develop" }
set :application, "Skeleton"
set :repo_url, "git@github.com:fguillen/Skeleton.git"
set :deploy_to, "/var/www/skeleton.daliaresearch.com"
set :log_level, :debug
set :use_sudo, false
set :keep_releases, 5
set :migration_role, :app

# after "deploy", "customs:symlink"
after "deploy", "deploy:cleanup"

namespace :customs do
  task :symlink do
    on roles(:app) do
      execute "ln -nfs #{shared_path}/system/database.yml #{current_path}/config/database.yml"
      execute "ln -nfs #{shared_path}/system/app_config.yml #{current_path}/config/app_config.yml"
    end
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Restart app"
  task :restart do
    on roles(:app) do
      execute "mkdir #{current_path}/tmp"
      execute "touch #{current_path}/tmp/restart.txt"
    end
  end
end
