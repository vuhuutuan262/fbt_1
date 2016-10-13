module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    def show?
      user.try :is_admin?
    end
  end
end
