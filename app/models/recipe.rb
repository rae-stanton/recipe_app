# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  cuisine     :string
#  description :text
#  diet        :string
#  difficulty  :integer
#  favorite    :boolean          default(FALSE), not null
#  name        :text
#  notes       :text
#  time        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint
#
# Indexes
#
#  index_recipes_on_author_id  (author_id)
#
class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :ingredients
  has_one_attached :photo

  enum difficulty: {
    beginner: 0,
    intermediate: 1,
    advanced: 2,
    expert: 3
  }
  validates :difficulty, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :favorites, -> { where(favorite: true) }

  def toggle_favorite!
    return update(favorite: false) if favorite.present? # this is equivalent to favorite == true

    update(favorite: true)
  end

end
