require 'rails_helper'

RSpec.describe "CreateUsers", type: :request do
  it "Adds a User after a user is created" do
   visit users_path
   click_button "neu"
  end
end
