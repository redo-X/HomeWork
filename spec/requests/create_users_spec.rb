require 'rails_helper'

RSpec.describe "CreateUsers", type: :request do
  it "Adds a User after a user is created" do
    visit users_path
    click_button "neu"
    fill_in "user_email", :with => "tester@system.de"
    fill_in "user_password", :with => "user"
    fill_in "user_password_confirmation", with => "user"
  end
end
