require 'rails_helper'
require 'spec_helper'

RSpec.feature 'ArticleCreations','as a registered "user"' do
  context 'At Welcome-page'do
    let(:user) {FactoryGirl.create(:user)}
    scenario 'sign in' do
      visit welcome_index_path
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button "Anmelden"
      current_path.should eq(new_user_session_path)
    end
    scenario 'article creation'do
      visit articles_path
      current_path.should eq(articles_path)
      click_button('Neu')
    end
  end
end
