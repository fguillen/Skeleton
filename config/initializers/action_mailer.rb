if APP_CONFIG[:smtp]["enabled"]
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => APP_CONFIG[:smtp]["server"],
    :port => APP_CONFIG[:smtp]["port"],
    :domain => APP_CONFIG[:smtp]["domain"],
    :user_name => APP_CONFIG[:smtp]["user_name"],
    :password => APP_CONFIG[:smtp]["password"],
    :authentication => "plain",
    :enable_starttls_auto => true
  }
end