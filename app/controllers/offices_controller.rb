class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    #  @offices = policy_scope(Office)# can delete the word all because you're calling twice (office_police + here)
    @offices = policy_scope(Office.all)
  end

  def show
    # authorize @office
    @booking = Booking.new
    @markers = [{
      lat: @office.latitude,
      lng: @office.longitude
    }]
  end

  def new
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user

    authorize @office

    if @office.save
      redirect_to office_path(@office)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # authorize @office
  end

  def update
    # authorize @office
    @office.photos.destroy_all
    if @office.update(office_params)
      redirect_to office_path(@office)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    #authorize @office
    @office.destroy
    redirect_to offices_path, status: :see_other
  end

  private
  def set_office
    @office = Office.find(params[:id])
    authorize @office
  end

  def office_params
    params.require(:office).permit(:address, :start_date, :end_date, :name, :price, :description, photos: [])
  end

end
