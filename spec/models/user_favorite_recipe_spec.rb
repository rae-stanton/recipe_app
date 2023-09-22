require 'rails_helper'

RSpec.describe UserFavoriteRecipe, type: :model do
  let(:faust) { User.create!(name: "Faust", email: "faust@example.com", password: "password", password_confirmation: "password") }
  let(:recipe) { Recipe.create!(name: "Eggplant Hee Hee", author: faust, difficulty: "beginner", description: "Something tasty") }

  describe "favoriting a recipe" do
    it "allows a user to favorite a recipe" do
      UserFavoriteRecipe.create!(user: faust, recipe: recipe)
      expect(faust.favorite_recipes).to include(recipe)
    end
  end

  describe "unfavoriting a recipe" do
    before do
      UserFavoriteRecipe.create!(user: faust, recipe: recipe)
    end

    it "allows a user to unfavorite a recipe" do
      UserFavoriteRecipe.where(user: faust, recipe: recipe).first.destroy!
      expect(faust.favorite_recipes).not_to include(recipe)
    end
  end
end
