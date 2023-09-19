class DashboardController < ApplicationController
  def index
    @all_recipes = @current_user.recipes
    @favorite_recipes = @current_user.favorite_recipes

  end

  def show
  end
end

