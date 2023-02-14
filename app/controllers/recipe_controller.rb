class RecipeController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to :action => 'list'
    else
      @ingredients = Ingredient.all
      render :action => 'new'
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
