class RecipesController < ApplicationController

 def index
  @user = User.first
  @recipes = @user.recipes
 end

 def show
  #show a page for specific recipe ID - use https://guides.rubyonrails.org/routing.html for helpers for id to link to.
  
  @recipe = Recipe.find(params[:id])

 end
end

