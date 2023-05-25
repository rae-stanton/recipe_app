require "rails_helper"

RSpec.describe "User Dashboard Page",
               type: :feature do

  let!(:user) do
    User.create(
      name: "foosta",
      email: "foosta@bubba.com",
      password: "foosta",
      password_confirmation: "foosta"
    )
  end

  scenario "current user's dashboard should,
    have a carousel with favorite recipes,
    and buttons that add recipe or view all" do
      visit new_session_path
      fill_in "email", with: "foosta@bubba.com"
      fill_in "password", with: "foosta"
      click_button "Login"
      visit dashboard_index_path
      expect(page).to have_content(user.name)
      expect(page).to have_content("Here are some things you can do.")
      click_link "Add Your Recipe"
      expect(page).to have_content("New Recipe")
      visit dashboard_index_path
      expect(page).to have_content("Here are some of your favorite recipes:")
      click_link "View All Recipes"
      expect(page).to have_content("Some recipes for you:")
  end
end
