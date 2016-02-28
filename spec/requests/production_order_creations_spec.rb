require 'rails_helper'
require 'spec_helper'

RSpec.describe 'ProductionOrderCreations','as a registered "user"' do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:article) {FactoryGirl.create(:article)}
  let!(:customer) {FactoryGirl.create(:customer)}
  let!(:work_plan) {FactoryGirl.create(:work_plan)}


  context 'When logged out'do
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Anmelden'
      current_path.should eq(root_path)
      visit production_orders_path
      current_path.should eq(production_orders_path)
      click_link('buttonNew')
      current_path.should eq(new_production_order_path)
      fill_in 'production_order_number', :with => '1001'
      select article.name, :from =>'production_order_article_id'
      select customer.name1, :from =>'production_order_customer_id'
      fill_in 'poduction_order_description', :with => 'Testbeschreibung... '
      fill_in 'poduction_order_quantity', :with => '2'
      select work_plan.name, :from =>'production_order_work_plan_id'
      click_button 'Erstellen'
    end
  end
end
