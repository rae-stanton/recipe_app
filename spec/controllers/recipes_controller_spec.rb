require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  let!(:user) do 
    User.create(
      name: "foosta", 
      email: "foosta@bubba.com", 
      password: "foosta", 
      password_confirmation: "foosta"
    ) 
  end
  
  describe 'index action' do  
    it "renders the :index view" do
      get :index
      expect(response).to render_template "recipes/index"
    end
  end
end
