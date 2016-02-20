class AddFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :web, :string
  end
end
