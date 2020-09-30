class ProductCategoryPolicy < ApplicationPolicy
  def index?
    return true
  end

  def create?
    user.admin?
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
