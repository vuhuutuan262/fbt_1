class CategoryPolicy < ApplicationPolicy
  def new
    create?
  end

  def create?
    user.try :is_admin?
  end

  def index?
    user.try :is_admin?
  end

  def update?
    user.try :is_admin?
  end

  def edit?
    update?
  end

  def destroy
    user.try :is_admin?
  end
end
