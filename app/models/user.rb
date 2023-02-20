class User < ApplicationRecord
  has_many :recipes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :name, uniqueness: {message: "The username %{value} already exists!"}
  validates :email, presence: true
  validates :email, uniqueness: {message: "The email %{value} is already in use."}
end
