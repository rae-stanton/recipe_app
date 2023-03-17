class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :favorite]

  def index
    @recipes = @current_user.recipes
  end

  def show

  end

  def update
    @recipe.update(favorite: "true")
    @recipe.save
  end

  def favorite # HTTP POST request
    @recipe.toggle_favorite!

    redirect_to recipe_path(id: @recipe.id)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
