class IngredientController < ApplicationController
  def list
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
  end

  def ingredient_params
    
  end

  def edit
  end

  def update
  end

  def delete
  end
end
