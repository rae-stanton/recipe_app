module RecipesHelper
  def display_favorite(favorite_recipe)
    if favorite_recipe == true
      "Favorited"
    else
      "Not a fave"
    end
  end
end
