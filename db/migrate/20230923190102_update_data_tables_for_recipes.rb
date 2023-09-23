class UpdateDataTablesForRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :diet
    remove_column :ingredients, :measurement
    remove_column :ingredients, :quantity

    add_column :ingredients, :name, :string
  end
end
