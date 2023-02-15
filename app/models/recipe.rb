class Recipe < ApplicationRecord
  belongs_to :user #author
  has_many :ingredients
end
