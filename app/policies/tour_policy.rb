class TourPolicy < ApplicationPolicy
  def new?
    create?
  end

  def show?
    true
  end

  def create?
    user.try :is_admin?
  end

  def index?
    true
  end

  def update?
    user.try :is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.try :is_admin?
  end
end
