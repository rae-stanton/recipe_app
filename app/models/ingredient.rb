# == Schema Information
#
# Table name: ingredients
#
#  id          :bigint           not null, primary key
#  ingredient  :string
#  measurement :string
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Ingredient < ApplicationRecord
  belongs_to :recipe
end
