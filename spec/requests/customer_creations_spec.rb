require 'rails_helper'
require 'spec_helper'

RSpec.describe 'CustomerCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user, :admin)}


  context 'When logged out'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Anmelden'
      current_path.should eq(root_path)
      visit customers_path
      current_path.should eq(customers_path)
      click_link('buttonNew')
      current_path.should eq(new_customer_path)
      fill_in 'customer_name1', :with => 'A AG'
      click_button 'Erstellen'
      page.html.should include('Kunde wurde erfolgreich angelegt.')
    end
  end
end
