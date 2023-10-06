class RemoveIngredientFromIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :ingredient, :string
  end
end
