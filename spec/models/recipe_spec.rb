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
require "rails_helper"

RSpec.describe Recipe, type: :model do # rubocop:disable Metrics/BlockLength
  let(:faust) { User.create(name: "Faust") }
  let(:recipe) do
    Recipe.create(name: "Eggplant Hee Hee", author: faust,
                  difficulty: "beginner", favorite: true,
                  description: "Something tasty")
  end

  it "has an author" do
    expect(recipe.author.name).to eq("Faust")
  end

  describe "can change difficulty" do
    it "has a beginner difficulty" do
      expect(recipe.difficulty).to eq("beginner")
    end

    it "has an intermediate difficulty" do
      recipe.intermediate!
      expect(recipe.difficulty).to eq("intermediate")
    end

    it "has an advanced difficulty" do
      recipe.advanced!
      expect(recipe.difficulty).to eq("advanced")
    end

    it "has an expert difficulty" do
      recipe.expert!
      expect(recipe.difficulty).to eq("expert")
    end
  end

  it "is a favorite recipe" do
    expect(recipe.favorite).to be(true)
  end

  it "is not a favorite recipe" do
    recipe.favorite = false
    expect(recipe.favorite).to be(false)
  end

  describe "favorites scope:" do
    let!(:recipe1) do
      Recipe.create(author: faust, difficulty: "expert",
                    name: "Favorite Recipe", favorite: true, description: "Something tasty")
    end
    let!(:recipe2) do
      Recipe.create(author: faust, difficulty: "expert",
                    name: "NOT Favorite Recipe", favorite: false, description: "Something tasty")
    end
    let!(:recipe3) do
      Recipe.create(author: faust, difficulty: "expert",
                    name: "Favorite Recipe 2", favorite: true, description: "Something tasty")
    end

    it "returns favorite recipes only" do
      expect(Recipe.favorites.pluck(:name)).to include(recipe1.name)
      expect(Recipe.favorites.pluck(:name)).to include(recipe3.name)
    end

    it "excludes non favorite recipes" do
      expect(Recipe.favorites.pluck(:name)).to_not include(recipe2.name)
    end
  end
end
