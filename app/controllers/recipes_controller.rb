class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :favorite, :unfavorite, :edit, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = Recipe.all
  end

  def show
    @favorited_recipe = UserFavoriteRecipe.where(user: @current_user, recipe: @recipe).first
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
    if @recipe.author == @current_user
      render :edit
    else
      redirect_to recipe_path, alert: "You can't edit someone else's recipe!"
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def favorite # HTTP POST request
    UserFavoriteRecipe.create(user: @current_user, recipe: @recipe)
    redirect_to recipe_path(id: @recipe.id)
  end

  def unfavorite
    UserFavoriteRecipe.where(user: @current_user, recipe: @recipe).first.destroy
    redirect_to recipe_path(id: @recipe.id)
  end

  def destroy
    if @recipe.author == @current_user
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted successfully.'
    else
      redirect_to recipes_path, alert: "You can't delete someone else's recipe!"
    end
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :description, :photo)
  end

  def authenticate_user!
    redirect_to new_session_path unless @current_user
  end
end
