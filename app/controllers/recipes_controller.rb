class RecipesController < ApplicationController
  def index
    @recipes = @current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(favorite: "true")
    @recipe.save
  end

  def favorite # HTTP POST request
    @recipe = Recipe.find(params[:recipe_id])

    if @recipe.favorite == false
      @recipe.update(favorite: true)
    else
      @recipe.update(favorite: false)
    end
    #if recipe not favorite, update to true
    # else recipe is favorite update to false
    #recipe.save
    redirect_to recipe_path(id: @recipe.id)
  end
end
