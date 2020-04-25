class ReviewsController < ApplicationController
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      @restaurant.rating = give_rating
      @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else 
      render :new
    end
  end

private
  def give_rating
    rating = 0
    @restaurant.reviews.each do |review|
      rating += review.rating
    end
    rating = rating / @restaurant.reviews.count
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
