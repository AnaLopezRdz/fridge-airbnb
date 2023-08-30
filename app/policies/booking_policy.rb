class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

    def show?
      return true
    end

    def new?
      return create?
    end

    def create?
      return true
    end

    def edit?
      return update?
    end

    def update?
      return record.user == user
    end

    def destroy
     return record.user == user
    end

    def set_booking?
      return true
      # @booking = Booking.find(params[:id])
      # authorize @booking
    end

  end
end
