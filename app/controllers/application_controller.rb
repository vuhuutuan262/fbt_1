class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :load_notifications
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :access_denied

  private
  def after_sign_in_path_for user
    current_user.is_admin? ? admin_dashboard_path : root_path
  end

  def access_denied exception
    redirect_to root_path, alert: exception.message
  end

  def load_places
    @places_select = Place.all.collect{|place| [place.name, place.id]}
  end

  def load_notifications
    if current_user
      @activities = Activity.my_activity current_user.id
      @count_activities =
        (Activity.notification_activities current_user.id).count
    end
  end
end
