class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.includes(:ratings)
  end

  def new
  end

  def rate
    if !session[:id]
      redirect_to '/'
    else
      @restaurant = Restaurant.find(params[:id])
    end
  end

  def create
    if !session[:id]
      redirect_to '/'
    else
      restaurant = Restaurant.new(name:params[:name])
      restaurant.user_id = session[:id]
      restaurant.save
      if restaurant.save
        redirect_to '/restaurants'
      else
        redirect_to '/restaurants/create'
      end
    end
  end
end
