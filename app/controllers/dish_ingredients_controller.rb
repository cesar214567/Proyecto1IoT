class DishIngredientsController < ApplicationController

  def new
    @dish = Dish.find(params[:dish_id])
    @dish_ingredient = DishIngredient.new
  end

  def create

    @dish = Dish.find(params[:dish_id])
    @dish_ingredient = DishIngredient.new(dish_ingredient_params)
    @dish_ingredient.dish = @dish
    if @dish_ingredient.save!
      redirect_to restaurant_dish_path(@dish.restaurant, @dish)
    else
      redirect_to new_dish_dish_ingredient_path(@dish.restaurant, @dish)
    end
  end

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(:ingredient_id)
  end
end
