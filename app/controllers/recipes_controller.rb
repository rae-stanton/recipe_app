class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :favorite, :unfavorite, :edit, :destroy]
  before_action :set_ingredients, only: [:new, :edit]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = Recipe.all
  end

  def show
    @favorited_recipe = UserFavoriteRecipe.where(user: @current_user, recipe: @recipe).first
  end

def create
  @recipe = Recipe.new(recipe_params.merge(author: @current_user))

  if @recipe.save
    redirect_to @recipe, notice: 'Recipe created successfully.'
  else
    # Rebuild ingredients in case the form needs to be rendered again
    3.times { @recipe.recipe_ingredients.build } if @recipe.recipe_ingredients.size < 3
    render :new, status: :unprocessable_entity
  end
end


  def edit
    @recipe = Recipe.find(params[:id])
    3.times { @recipe.recipe_ingredients.build if @recipe.recipe_ingredients.size < 3 }
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe updated successfully!"
    else
      puts @recipe.errors.full_messages # This will print any validation errors to the console
      render :edit, status: :unprocessable_entity
    end
  end

  def favorite
    UserFavoriteRecipe.create(user: @current_user, recipe: @recipe)
    redirect_to recipe_path(id: @recipe.id)
  end

  def unfavorite
    UserFavoriteRecipe.where(user: @current_user, recipe: @recipe).first.destroy
    redirect_to recipe_path(id: @recipe.id)
  end

  def recipe_ingredients
    RecipeIngredient.create(ingredient: @ingredient, recipe: @recipe)
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

  def set_ingredients
    @ingredients = Ingredient.all # Fetch all ingredients for collection_select
  end

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :description, :photo,
                                  recipe_ingredients_attributes: [
                                    :id, :ingredient_name, :quantity, :measurement, :_destroy
                                  ])
  end


  def authenticate_user!
    redirect_to new_session_path unless @current_user
  end
end
