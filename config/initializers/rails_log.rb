log_tags = []
log_tags << lambda { |req| Time.now.strftime("%F %T.%L") }
log_tags << lambda { |req| req.uuid.first(8) }

Rails.configuration.log_tags = log_tags



