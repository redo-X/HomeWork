class AddFieldsToProductionOrders < ActiveRecord::Migration
  def change
    add_column :production_orders, :user_id, :integer
  end
end
