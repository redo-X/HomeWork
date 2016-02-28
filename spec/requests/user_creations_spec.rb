require 'rails_helper'
require 'spec_helper'

RSpec.describe 'ArticleCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user, :admin)}


  context 'When logged out'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Anmelden'
      current_path.should eq(root_path)
      visit users_path
      current_path.should eq(users_path)
      click_link('buttonNew')
      current_path.should eq(new_user_path)
      fill_in 'article_code', :with => '1234'
      fill_in 'article_name', :with => 'Fahrrad'
      fill_in 'article_version', :with => '1.0'
      select article_group.display_name, :from =>'article_article_group_id'
      click_button 'Erstellen'
      page.html.should include('Benutzer wurde erfolgreich angelegt.')
    end
  end
end
