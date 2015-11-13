source "https://rubygems.org"

gem "rails", "4.2.5"
gem "activerecord-session_store"
gem "protected_attributes"

gem "sqlite3"
gem "json"
gem "paperclip"

# Exception notifier (maybe you only want one)
gem "exception_notification"
gem "rollbar"

gem "aws-sdk"
gem "strip_attributes"
gem "will_paginate"
gem "will_paginate-bootstrap", :git => "https://github.com/mrfoto/will_paginate-bootstrap.git"
gem "bluecloth"
gem "authlogic"
gem "scrypt" # authlogic dependency
gem "ruby_regex", :git => "git@github.com:fguillen/ruby_regex.git"
gem "lograge" # log cleaning
gem "acts-as-taggable-on"
gem "log_book", :git => "git@github.com:fguillen/LogBook.git"
gem "whenever", :require => false
gem "style_palette", :git => "git://github.com/fguillen/StylePalette.git"
gem "minitest-rails"

group :development do
  gem "nifty-generators"
  gem "faker"
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-rails", "~> 1.1.0"
  gem "capistrano-rbenv", github: "capistrano/rbenv"
end

group :test do
  gem "mocha", "1.0.0", :require => false
  gem "factory_girl"
  gem "simplecov", :require => false
  gem "delorean"
  gem "capybara"
  gem "database_cleaner"

  gem "minitest"
  gem "minitest-rails-capybara"
  # gem "minitest-colorize"
  gem "minitest-focus"
end
