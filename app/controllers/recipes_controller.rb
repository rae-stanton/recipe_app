class RecipesController < ApplicationController

 def index
  @user = User.first
  @recipes = @user.recipes
 end
end

