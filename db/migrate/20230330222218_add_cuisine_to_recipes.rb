class AddCuisineToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :cuisine, :string
  end
end
