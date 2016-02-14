class AddReferenceProductionOrdersCustomer < ActiveRecord::Migration
  def change
    add_reference :production_orders, :customer, index: true, foreign_key: true
  end
end
