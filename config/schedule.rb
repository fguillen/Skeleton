hostname = %x(hostname -s).strip

set :output, "/tmp/skeleton.log"
job_type :rbenv_rake, %Q{export PATH=/home/develop/.rbenv/shims:$PATH; eval "$(rbenv init -)"; cd :path && RAILS_ENV=:environment bundle exec rake :task --silent :output }

# PRODUCTION SERVER ###########################################
# if(hostname == "webprd001")
#   every 1.hour, :roles => [:whenever] do
#     rbenv_rake "test:task"
#   end
# end
