ActiveAdmin.setup do |config|
  config.comments = false
  config.batch_actions = true
  config.register_javascript "ckeditor/init.js"
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
end
