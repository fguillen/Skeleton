# require "bundler/capistrano"

set :rbenv_ruby, File.read('.ruby-version').strip
set :ssh_options, { :forward_agent => false, :user => "develop" }
set :application, "CampaignPlatform"
set :repo_url, "git@github.com:DaliaResearch/CampaignPlatform.git"
set :deploy_to, "/var/www/campaignplatform.daliaresearch.com"
set :log_level, :debug
set :use_sudo, false
set :keep_releases, 5
set :migration_role, :app

namespace :customs do
  task :symlink do
    on roles(:app) do
      execute "rm -rf #{current_path}/log"
      execute "mkdir -p #{shared_path}/log"
      execute "ln -nfs #{shared_path}/log #{current_path}/log"

      execute "mkdir -p #{current_path}/tmp"
      execute "rm -rf #{current_path}/tmp/pids"
      execute "mkdir -p #{shared_path}/pids"
      execute "ln -nfs #{shared_path}/pids #{current_path}/tmp/pids"
    end
  end

  task :restart do
    on roles(:app) do
      execute "touch #{current_path}/tmp/restart.txt"
    end

    # # delayed_job
    # on roles(:delayed_job) do
    #   within release_path do
    #     with rails_env: fetch(:rails_env) do
    #       execute :bundle, :exec, :'bin/delayed_job', args, :restart
    #     end
    #   end
    # end
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart do ; end
end

after "deploy", "customs:symlink"
after "deploy", "deploy:cleanup"
after "deploy", "customs:restart"




