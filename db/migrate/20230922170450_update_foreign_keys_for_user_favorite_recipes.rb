class UpdateForeignKeysForUserFavoriteRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :user_favorite_recipes, :recipes
    remove_foreign_key :user_favorite_recipes, :users

    add_foreign_key :user_favorite_recipes, :recipes, on_delete: :cascade, on_update: :cascade
    add_foreign_key :user_favorite_recipes, :users, on_delete: :cascade, on_update: :cascade
  end
end
