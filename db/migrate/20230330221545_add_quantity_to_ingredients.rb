class AddQuantityToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :quantity, :integer
  end
end
