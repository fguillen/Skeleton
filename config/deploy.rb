require "bundler/capistrano"

set :application, "skeleton"
set :scm, :git
set :repository,  "git@github.com:fguillen/Skeleton.git"
set :deploy_to, "/home/www/skeleton.fernandoguillen.info"
set :user, "fguillen"
set :group, "fguillen"
set :use_sudo, false

set :rvm_ruby_string, ENV["GEM_HOME"].gsub(/.*\//,"")
set :rvm_install_ruby_params, "--1.9"      # for jruby/rbx default to 1.9 mode
set :rvm_install_pkgs, %w[libyaml openssl] # package list from https://rvm.io/packages
set :rvm_install_ruby_params, "--with-opt-dir=/usr/local/rvm/usr" # package support

before "deploy:setup", "rvm:install_rvm"   # install RVM
before "deploy:setup", "rvm:install_pkgs"  # install RVM packages before Ruby
before "deploy:setup", "rvm:install_ruby"  # install Ruby and create gemset, or:
before "deploy:setup", "rvm:create_gemset" # only create gemset
before "deploy:setup", "rvm:import_gemset" # import gemset from file

require "rvm/capistrano"

server "skeleton.fernandoguillen.info", :web, :app, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end