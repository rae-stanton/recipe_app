require "rails_helper"

# When writing a feature spec, write a description of what is happening
# in the browser from the perspective of the User/role/etc

RSpec.describe "Recipes Index Page",
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

  let!(:recipe_two) do
    Recipe.create(
      name: "Eggplant Parmasean",
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

  it 'user visits the index page,
      clicks a see recipe button,
      views the recipe details,
      goes back to the index page,
      clicks another see recipe button,
      views the recipe details' do

    visit recipes_path
    expect(page).to have_content("Recipes")
    expect(page).to have_content("Some recipes for you:")

    page.find_link(id: "button_#{recipe_two.id}").click
    expect(page).to have_content("Recipe Details")
    expect(page).to have_content(recipe_two.name)

    visit recipes_path
    expect(page).to have_content("Recipes")
    page.find_link(id: "button_#{recipe.id}").click
    expect(page).to have_content(recipe.name)
  end
end
