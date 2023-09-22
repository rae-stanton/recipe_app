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
      description: "something good",
      difficulty: "beginner",
      author: user,
      favorite: true
    )
  end

  before :each do
    visit new_session_path
    fill_in "email", with: "foosta@bubba.com"
    fill_in "password", with: "foosta"
    click_button "Login"
  end

  scenario "user clicks on a recipe from index page,
            user sees button with text 'Un-favorite Recipe'" do
    recipe.favorite = true
    recipe.save
    recipe.reload

    visit recipes_path
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
    click_on "Favorite This Recipe"
    click_button "Un-favorite Recipe"
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

  scenario "user clicks on a recipe,
            user clicks delete,
            recipe is deleted" do
    visit recipes_path
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
    click_link "Delete Recipe"
    expect(page).to_not have_content(recipe.id)
    expect(page).to have_content("Recipe deleted successfully")
  end
end
