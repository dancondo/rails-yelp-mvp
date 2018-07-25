class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @restaurant, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @review.destroy
    # respond_to do |format|
    #   format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
    # end
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
