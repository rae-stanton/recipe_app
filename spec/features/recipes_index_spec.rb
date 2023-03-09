require "rails_helper"


RSpec.describe RecipesController, type: :feature do
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
  

  it 'shows a list of recipes' do
    visit recipes_path
    expect(page).to have_content("Recipes")
    click_link_or_button "See Recipe"
    visit recipe_path(id: recipe.id)
  end
end