require 'rails_helper'
require 'spec_helper'

RSpec.describe 'ArticleCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user)}
  context 'At Welcome-page'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button "Anmelden"
      current_path.should eq(welcome_index_path)
      visit articles_path
      current_path.should eq(articles_path)
      click_button('Neu')
    end
  end
end
