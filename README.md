# NewProject

Opinionated _Rails project template_.

With all these libraries configured and working

## Setup

Replace `<ProjectName>` with yout project name:

    curl -#L https://raw.github.com/fguillen/Skeleton/master/etc/osx_init.rb | PROJECT_NAME=<ProjectName> ruby
    cd <ProjectName>
    cp .rvmrc.example .rvmrc
    cd .
    # check if gemset has been created properly

    cp config/app_config.yml.example config/app_config.yml
    cp config/database.yml.example config/database.yml
    bundle
    rake db:schema:load db:seed
    rake test
    rails s
    open http://localhost:3000/admin

## Including

### Rails

* [Rails 3.2.14](https://github.com/rails/rails)
* _Deactivated_ [RailsSprockets](https://github.com/sstephenson/sprockets)
* [ERB](http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html)
* [ActionMailer](https://github.com/rails/rails/tree/master/actionmailer)

### Config

* [NiftyGenerators](https://github.com/ryanb/nifty-generators) config, based in a yml file.

### Exceptions

* [ExceptionNotification](https://github.com/smartinez87/exception_notification)

### Uploads

* [Paperclip](https://github.com/thoughtbot/paperclip)
* [AmazonS3 support](https://github.com/aws/aws-sdk-ruby)

### Login

* [Authlogic](https://github.com/binarylogic/authlogic)

### i18n

* [i18n](https://github.com/svenfuchs/i18n) with placeholders to `:es` and `:en locales

### Validations

* [RubyRegex](https://github.com/eparreno/ruby_regex)

### Testing

* [TestUnit](http://ruby-doc.org/stdlib-1.9.3/libdoc/test/unit/rdoc/Test/Unit.html)
* [Mocha](https://github.com/freerange/mocha)
* [FactoryGirl](https://github.com/thoughtbot/factory_girl)
* [Delorean](https://github.com/bebanjo/delorean)
* [Simplecov](https://github.com/colszowka/simplecov)
* [Capybara](https://github.com/jnicklas/capybara)
* [DatabaseCleaner](https://github.com/bmabey/database_cleaner)

### Deploying

* [Capistrano](https://github.com/capistrano/capistrano)

### Initializers

* Date Formats
* Exception if _locale_ not found
* Paperclip interpolation example
* Rails log customization
* Lograge customization
* String extensions

### Layout

* [Bootstrap 3](http://twitter.github.com/bootstrap)
* [FontAwesome icons](http://fortawesome.github.io/Font-Awesome/)

### Functionality

* Admin/Front namespaces
* Login/Logout/Remember password
* Change locale
* AdminUsers management
* Items management, _click&drap_ sorting
* [Pics ajax management](https://github.com/fguillen/BBAssetsUpload)
* Static pages
* [AppConfig](https://github.com/ryanb/nifty-generators)


## TODO

* Improve test coverage