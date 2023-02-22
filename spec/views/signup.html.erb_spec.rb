require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "GET /signup" do
  it "shows a form" do
    get :signup
      expect(response).to render_template "static_pages/signup"
    end
  end
end