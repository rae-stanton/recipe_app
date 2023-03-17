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

  scenario "user clicks on a recipe from index page,
            user sees button with text 'favorited recipe'" do

    visit recipes_path
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
    click_button "Favorited Recipe"
  end

  scenario "user visits recipe index page,
            user clicks on a recipe,
            user can favorite that recipe" do

    recipe.favorite = false
    recipe.save
    recipe.reload

    visit recipes_path
    page.find_link(id: "button_#{recipe.id}").click
    click_button "Favorite This Recipe"
  end
end


