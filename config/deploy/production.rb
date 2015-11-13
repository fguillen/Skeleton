set :stage, :production

set :rails_env, "production"
set :branch, "production"
role :app, ["webprd001.it.skeleton.com", "webprd002.it.skeleton.com"]
role :web, ["webprd001.it.skeleton.com", "webprd002.it.skeleton.com"]

# whenever
role :whenever, ["webprd001.it.skeleton.com"]
set :whenever_roles, :whenever