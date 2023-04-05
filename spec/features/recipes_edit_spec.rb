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
      description: "something good",
      difficulty: "beginner",
      author: user
    )
  end

  before :each do
    visit new_session_path
    fill_in "email", with: "foosta@bubba.com"
    fill_in "password", with: "foosta"
    click_button "Login"
  end

  scenario "user clicks on recipe,
  user visits full recipe page,
  user edits recipe,
  recipe gets updated if valid" do
    visit recipes_path
    expect(page).to have_content("Recipes")
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
    click_link "Edit Recipe"
    expect(page).to have_content("Edit Recipe")
  end

  scenario "user clicks on recipe,
  user tries to edit recipe,
  but the recipe is not valid" do
    visit recipes_path
    expect(page).to have_content("Recipes")
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
    click_link "Edit Recipe"
    expect(page).to have_content("Edit Recipe")
    fill_in "Description", with: "No"
    click_button "Submit"
    expect(page).to have_content("Description is too short (minimum is 10 characters)")
  end
end
