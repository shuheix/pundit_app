class AccountPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.has_role? :admin || :leader
  end

  def update?
    user.has_role? :admin || :leader || :engineer || :common
  end

  def destroy?
    user.has_role? :admin
  end

  class Scope

  end
end
