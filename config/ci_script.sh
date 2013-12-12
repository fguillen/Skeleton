echo "Build Number: $BUILD_NUMBER"
echo $PATH
whoami
pwd
ruby -v
date

echo "---START---"

echo -e "test: {adapter: 'mysql2', database: 'bamboo_$BUILD_NUMBER', host: 'dbhost', username: 'dbuser', password: 'dbpass'}" > config/database.yml
RAILS_ENV=test bundle --no-color
RAILS_ENV=test bundle exec rake db:create db:schema:load
RAILS_ENV=test bundle exec rake
RAILS_ENV=test bundle exec rake db:drop

echo "---END---"
