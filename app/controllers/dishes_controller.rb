class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new(restaurant:@restaurant)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new(dish_params)
    @dish.restaurant = @restaurant
    if @dish.save!
      redirect_to restaurant_path(@dish.restaurant)
    else
      redirect_to new_restaurant_dish_path(@restaurant, @dish)
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:restaurant_id, :name, :description, :cost,:image)
  end
end
