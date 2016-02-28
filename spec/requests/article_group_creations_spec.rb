require 'rails_helper'
require 'spec_helper'

RSpec.describe 'ArticleGroupCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user)}


  context 'When logged out'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Anmelden'
      current_path.should eq(root_path)
      visit article_groups_path
      current_path.should eq(article_groups_path)
      click_link('buttonNew')
      current_path.should eq(new_article_group_path)
      fill_in 'article_group_code', :with => '789'
      fill_in 'article_group_name', :with => 'Fahrzeuge'
      click_button 'Erstellen'
    end
  end
end
