class IngredientsController < ApplicationController

    def new
        @ingredient =  Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to root_path
        else
            redirect_to new_ingredient_path(@ingredient)
        end
    end

    private 

    def ingredient_params
        params.require(:ingredient).permit(:name,:image)
    end
end
