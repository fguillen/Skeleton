set :stage, :staging

set :rails_env, "staging"
set :branch, "staging"
role :app, ["webdev001.it.skeleton.com", "webdev002.it.skeleton.com"]
role :web, ["webdev001.it.skeleton.com", "webdev002.it.skeleton.com"]

# whenever
role :whenever, ["webdev001.it.skeleton.com"]
set :whenever_roles, :whenever