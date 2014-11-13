source "https://rubygems.org"

gem "rails", "~> 4.1.7"
gem "activerecord-session_store"
gem "protected_attributes"

gem "sqlite3"
gem "json"
gem "paperclip"
gem "exception_notification"
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
gem "log_book", "~> 0.1.7"
gem "style_palette", :git => "git://github.com/fguillen/StylePalette.git"

group :development do
  gem "nifty-generators"
  gem "faker"
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-rails", "~> 1.1.0"
  gem "capistrano-rbenv", github: "capistrano/rbenv"
end

group :test do
  gem "mocha"#, :require => false
  gem "factory_girl"
  gem "simplecov", :require => false
  gem "delorean"
  gem "capybara", "2.2.0"
  gem "database_cleaner"
  gem "selenium-webdriver", "2.35.1"

  gem "minitest-rails", "~> 2.1.0"
  gem "minitest-rails-capybara", "~> 2.1.1"
  gem "minitest-focus"
end
