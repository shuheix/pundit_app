class NotePolicy < ApplicationPolicy
  # attr_reader :user, :record
  #
  # def initialize(user, record)
  #   @user = user
  #   @record = record
  # end
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def index?
      scope.all
    end

    def resolve

    end
  end
end
