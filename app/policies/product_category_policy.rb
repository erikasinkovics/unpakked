class ProductCategoryPolicy < ApplicationPolicy
  def create?
    user.admin? || record.user == user
  end

  def new?
    create?
  end

  def destroy?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
