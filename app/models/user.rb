class User < ApplicationRecord
  has_secure_password
  has_many :recipes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :name, uniqueness: {message: "%{value} already exists!"}
  validates :email, presence: true
  validates :email, uniqueness: {message: "%{value} is already in use."}
end
