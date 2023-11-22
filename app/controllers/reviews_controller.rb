class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params_review)
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
