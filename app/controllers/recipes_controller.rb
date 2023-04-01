class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :favorite, :edit, :destroy]

  def index
    @recipes = @current_user.recipes
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(author: @current_user))

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def favorite # HTTP POST request
    @recipe.toggle_favorite!
    redirect_to recipe_path(id: @recipe.id)
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :description)
  end
end
