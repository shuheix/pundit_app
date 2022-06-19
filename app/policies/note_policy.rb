class NotePolicy < ApplicationPolicy

  def create?
    @user.has_any_role? :admin, :leader, :engineer
  end

  def update?
    if @user.group_ids.include?(@record.group_id)
      @user.has_any_role? :admin, :leader, :engineer
    else
      false
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)# scopeにはpolicy_scopeの引数が入る
      @user = user
      @scope = scope
    end

    def resolve
      if @user.company.first == Company.find_by(name: "SIMULA")
        Note.all
      else
        Note.all.where(is_archived: false)
      end
    end
  end
end
