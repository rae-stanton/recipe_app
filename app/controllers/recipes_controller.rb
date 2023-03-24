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

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def favorite # HTTP POST request
    @recipe.toggle_favorite!

    redirect_to recipe_path(id: @recipe.id)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :description)
  end
end
