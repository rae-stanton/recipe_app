require "rails_helper"

RSpec.describe "user login", type: :feature do
  let!(:user) do
    User.create(
      name: "foosta",
      email: "foosta@bubba.com",
      password: "foosta",
      password_confirmation: "foosta"
    )
  end

  scenario "it allows user to log in,
  displays a login message,
  redirects to dashboard" do
    visit new_session_path
    expect(page).to have_content("Login")
    fill_in "email", with: "foosta@bubba.com"
    fill_in "password", with: "foosta"
    click_button "Login"
    expect(page).to have_content("Logged in!")
    expect(page).to have_content("Here are some of your favorite recipes")
  end

  scenario "it is not a valid login" do
    visit new_session_path
    expect(page).to have_content("Login")
    fill_in "email", with: "foosta@bubba.ca"
    fill_in "password", with: "foosta"
    click_button "Login"
    expect(page).to_not have_content("Here are some of your favorite recipes")
  end

  scenario "user should not have logout in nav if not logged in" do
    visit root_path
    expect(page).to_not have_content("Log out")
    visit new_session_path
    expect(page).to have_content("Login")
    fill_in "email", with: "foosta@bubba.com"
    fill_in "password", with: "foosta"
    click_button "Login"
    expect(page).to have_content("Logged in!")
    expect(page).to have_content("Log out")
  end
end
