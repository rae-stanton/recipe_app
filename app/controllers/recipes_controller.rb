class RecipesController < ApplicationController

  def index
    @user = User.first
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

