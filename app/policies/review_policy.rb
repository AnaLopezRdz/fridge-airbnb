class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

    def new?
      return create?
    end

    def create?
      return true
    end

    def destroy
      return record.user == user
    end
  end
end
