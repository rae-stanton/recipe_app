class AddIngredientToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :ingredient, :string
  end
end
