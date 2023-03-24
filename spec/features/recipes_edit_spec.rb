require "rails_helper"

RSpec.describe "Recipes Edit Page",
                type: :feature do
  let!(:user) do
    User.create(
      name: "foosta",
      email: "foosta@bubba.com",
      password: "foosta",
      password_confirmation: "foosta"
    )
  end
  let!(:recipe) do
    Recipe.create(
      name: "Eggplant Hee Hee",
      description: "something",
      difficulty: "beginner",
      author: user
    )
  end

  it "user clicks on recipe,
  user visits full recipe page,
  user edits recipe,
  recipe saves or gets an error" do
  end
end
