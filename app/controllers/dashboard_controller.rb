class DashboardController < ApplicationController
  def index
    @all_recipes = @current_user.recipes
    @favorite_recipes = @all_recipes.favorites
  end

  def show
  end
end

