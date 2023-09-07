class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    authorize @review

    if @review.save
      redirect_to booking_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end



  def destroy
    # authorize @review
    @review.destroy
    redirect_to review_path, status: :see_other
  end

  private
  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def booking_params
    params.require(:review).permit(:comment, :stars)
  end
end
