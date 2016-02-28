require 'rails_helper'
require 'spec_helper'

RSpec.describe 'WorkPlanCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user)}


  context 'When logged out'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Anmelden'
      current_path.should eq(root_path)
      visit work_plans_path
      current_path.should eq(work_plans_path)
      click_link('buttonNew')
      current_path.should eq(new_work_plan_path)
      fill_in 'work_plan_name', :with => 'Reifenherstellung'
      click_button 'Erstellen'
    end
  end
end
