require "rails_helper"

RSpec.describe "Recipes Show Page",
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
      author: user,
      favorite: true
    )
  end
end

#Not yet implemented
