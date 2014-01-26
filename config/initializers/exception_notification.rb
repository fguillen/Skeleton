if Rails.env.production? || Rails.env.staging?
  Skeleton::Application.config.middleware.use(
    ExceptionNotification::Rack,
    :email => {
      :email_prefix => "[Skeleton] ",
      :sender_address => APP_CONFIG[:admin_email],
      :exception_recipients => [APP_CONFIG[:admin_email]]
    }
  )
end