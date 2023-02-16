class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :ingredients
end
