class AddMeasurementToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :measurement, :string
  end
end
