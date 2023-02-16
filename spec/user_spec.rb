require 'rails_helper'

RSpec.describe User, type: :model do 
  it "returns user's full name" do
    user = User.create(name: "Foosta")

    expect(user.name).to eq "Foosta"
  end
end