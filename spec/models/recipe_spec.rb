require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:faust) { User.create(name: "Faust") }
  let(:recipe) { Recipe.create(name: "Eggplant Hee Hee", author: faust) }

  it 'has an author' do
    expect(recipe.author.name).to eq("Faust")

  end
end
