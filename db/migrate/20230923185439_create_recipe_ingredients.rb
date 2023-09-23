class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.references :ingredient, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.integer :quantity
      t.string :measurement
      t.string :diet
      t.timestamps
    end
  end
end
