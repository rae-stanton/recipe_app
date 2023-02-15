class RecipeController < ApplicationController
  def new
    @recipe = Recipe.new
   # @ingredients = @recipe.ingredients
  end

  def edit
    @recipe = Recipe.find(params[:id])
   # @ingredients = @recipe.ingredients
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user
    @recipe.save

    if @recipe.save
      redirect_to :action => 'list'
    else
      render 'new'
  end

  def update
  end

  def delete
    Recipe.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def list
    @recipes = Recipe.all
  end
end
