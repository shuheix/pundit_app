class AccountPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.has_any_role? :admin, :leader
  end

  def update?
    user.has_any_role? :admin, :leader,:engineer,:common
  end

  def destroy?
    user.has_role? :admin
  end
end
