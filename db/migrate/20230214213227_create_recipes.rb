class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|

      t.timestamps
      t.string :name
      t.belongs_to :author
    end
  end
end
