# NewProject

Opinionated _Rails project template_.

With all these libraries configured and working

## Setup

Replace `<ProjectName>` with yout project name:

    curl -#L https://raw.github.com/fguillen/Skeleton/master/etc/osx_init.rb | PROJECT_NAME=<ProjectName> ruby

    cd <ProjectName>
    rails s
    open http://localhost:3000/admin

## Including

### Rails

* [Rails 4.0.2](https://github.com/rails/rails)
* [ERB](http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html)
* [ActionMailer](https://github.com/rails/rails/tree/master/actionmailer)

### Ruby

* [Ruby 2.0.0](https://www.ruby-lang.org)

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

* [i18n](https://github.com/svenfuchs/i18n) with placeholders to `:es` and `:en` locales

### Validations

* [RubyRegex](https://github.com/eparreno/ruby_regex)

### Testing

* [MiniTest](https://github.com/seattlerb/minitest)
* [Mocha](https://github.com/freerange/mocha)
* [FactoryGirl](https://github.com/thoughtbot/factory_girl)
* [Delorean](https://github.com/bebanjo/delorean)
* [Simplecov](https://github.com/colszowka/simplecov)
* [Capybara](https://github.com/jnicklas/capybara)
* [DatabaseCleaner](https://github.com/bmabey/database_cleaner)

### Deploying

* [Capistrano](https://github.com/capistrano/capistrano)

### CI integration

* Bash script for [Jenkins](http://jenkins-ci.org/)

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
* Menu element actived helper
* Tableless model
* [LogBook](https://github.com/fguillen/LogBook) integration

## TODO

* Upgrade to Rails 4.2.0: (check SurveyPlatform project)
* Add whenever (including capistrano)
* Add sortable_link [1]
* Footer overhide the content on the bottom of the container.. look for ".container{ margin-bottom: -70px; }"
* Make `rake` to also execute tests in `test/etc` folder
* Test reset_password, reset_password_submit
* Change all urls by this style: [:offer_clicks, :provider, @provider_user, offer]
* Add Skeleton_session to be replaced in the init script
* Improve test coverage
* Make menu_class using Rails.application.routes.router.recognize(request){ |route, matches, parameters| puts route.name }
* Add `_searcher` module


[1] ---

    module PaginatedModel
      def paginated(opts = {})
        opts[:sort_attribute] ||= "created_at"
        opts[:sort_direction] ||= "desc"
        opts[:page] ||= 1

        paginate(
          :page => opts[:page],
          :per_page => APP_CONFIG[:elements_per_page]
        ).order("#{opts[:sort_attribute]} #{opts[:sort_direction]}")
      end
    end

    ActiveRecord::Base.extend PaginatedModel

    css
    application_helper
