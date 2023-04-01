class AddTimeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :time, :string
  end
end
