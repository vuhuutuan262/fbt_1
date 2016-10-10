ActiveAdmin.setup do |config|
  ActiveAdmin.setup do |config|
    config.comments = false
  end

  ActiveAdmin.setup do |config|
    config.namespace :admin do |admin|
      admin.comments = false
    end
  end

  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.batch_actions = true
  config.localize_format = :long
  config.include_default_association_filters = true
end
