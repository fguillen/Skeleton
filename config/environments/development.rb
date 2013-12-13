Skeleton::Application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.action_mailer.raise_delivery_errors = true
  # config.assets.debug = true

  # lograge
  config.lograge.enabled = false
end
