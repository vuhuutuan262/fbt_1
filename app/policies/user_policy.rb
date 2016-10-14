class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.try :is_admin?
  end

  def show?
    user.try :is_admin?
  end

  def destroy?
    user.try :is_admin?
  end

  def destroy_all?
    true
  end
end
