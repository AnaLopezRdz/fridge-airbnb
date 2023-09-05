class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :show, :destroy]
  before_action :set_office, only:[:new, :create]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @bookings = policy_scope(Booking)# can delete the word all because you're calling twice (Booking_police + here)
    @office = Office.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @markers = [{
      lat: @booking.office.latitude,
      lng: @booking.office.longitude
    }]
  end

  # def send_confirmation_email(booking)
  #   user = current_user

  #   BookingConfirmationMailer.confirmation_email(user, booking).deliver_now
  # end

  def new
    @booking = Booking.new

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.office = @office

    authorize @booking

    if @booking.save
      # send_confirmation_email(@booking)

      redirect_to booking_path(@booking)
    else
      render "offices/show", status: :unprocessable_entity
    end
  end

  def edit
    # authorize @booking
  end

  def update
    # authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @booking
    @booking.destroy
    redirect_to booking_path, status: :see_other
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
  def set_office
    @office = Office.find(params[:office_id])
  end
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_days, :price)
  end
end
