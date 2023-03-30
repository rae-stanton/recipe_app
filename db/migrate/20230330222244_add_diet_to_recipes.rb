class AddDietToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :diet, :string
  end
end
