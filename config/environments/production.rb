Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_level = :info

  # lograge
  config.lograge.enabled = true
end
