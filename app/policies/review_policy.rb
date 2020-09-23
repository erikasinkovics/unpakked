class ReviewPolicy < ApplicationPolicy
  def create?
    user.admin? || record.user == user && user.store_owner == false
  end

  def new?
    create?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
