require File.expand_path('../boot', __FILE__)

# require "active_record/railtie"
# require "action_controller/railtie"
# require "rake/testtask"
# require "action_mailer/railtie"
# # require "sprockets/railtie"
# require "minitest/rails/railtie"

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Skeleton
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true

    config.autoload_paths += %W(#{config.root}/lib)

    config.time_zone = "UTC"
    config.active_record.default_timezone = :utc

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :es]
    I18n.enforce_available_locales = true

    config.generators do |g|
      g.orm             :active_record
      g.test_framework  :test_unit, :fixture => false
      g.stylesheets     false
      g.helper          false
    end

    config.after_initialize do
      require "log_book/event"
    end
  end
end
