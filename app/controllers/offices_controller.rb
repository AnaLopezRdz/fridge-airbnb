class OfficesController < ApplicationController
  before_action :set_office, only: [ :show, :edit, :update, :destroy ]

  def index
    @offices = Office.all
  end

  def show
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    if @office.save
      redirect_to office_path(@office)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @office.update(office_params)
      redirect_to office_path(@office)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @office.destroy
    redirect_to office_path, status: :see_other
  end

  private

  def office_params
    params.require(:office).permit(:address, :available_date, :name, :price, :description)
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
