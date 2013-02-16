LinoEscalera::Application.config.middleware.use(
  ExceptionNotifier,
  :email_prefix => "[LinoEscalera] ",
  :sender_address => APP_CONFIG[:admin_email],
  :exception_recipients => [APP_CONFIG[:admin_email]]
)