class User < ApplicationRecord
  has_many :recipes, foreign_key: 'author_id'

  #validates :username, :password, presence: true
  #validates :username, uniqueness: {message: "The username %{value} already exists!"}
  #validates :password, length: {in: 6..15}, on: :create
  
end
