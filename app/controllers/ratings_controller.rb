class RatingsController < ApplicationController
  def update
    @rate = Rating.new(rating: params[:rate])
    @rate.user_id = session[:id]
    @rate.restaurant_id = params[:restaurant_id]
    @rate.save
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.average = Rating.where("restaurant_id = ?", params[:restaurant_id]).sum(:rating) / @restaurant.ratings.count
    @restaurant.save
    redirect_to '/restaurants'
  end
end
