Rails.application.config.session_store :active_record_store, :key => '_Skeleton_session'
ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
