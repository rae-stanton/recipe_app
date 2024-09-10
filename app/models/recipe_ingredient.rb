class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient, optional: true

  validates :quantity, presence: true
  validates :measurement, presence: true

  attr_accessor :ingredient_name

  before_validation :assign_ingredient

  private

  def assign_ingredient
    if ingredient_name.present?
      self.ingredient = Ingredient.find_or_create_by(name: ingredient_name.strip)
    end
  end
end
