class ReviewPolicy < ApplicationPolicy
  def update?
    user.try :is_admin? or is_owner?
  end

  def edit?
    update?
  end

  def destroy?
    user.try :is_admin? or is_owner?
  end
end
