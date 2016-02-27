require 'rails_helper'

RSpec.describe "AdminLogins", type: :request do
  it "shows the Admin Dashboard after the Admin logged in correctly" do
    visit welcome_index_path
    fill_in "user_email", :with => "admin@system.de"
    fill_in "user_password", :with => "geheim"
    click_button "Anmelden"
    current_path.should eq(new_user_session_path)
  end
end

