class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      cannot :manage, ActiveAdmin::Page, namespace_name: :admin
    end
  end
end
