class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :code
      t.string :name1
      t.string :name2
      t.string :phone
      t.string :fax
      t.string :mail
      t.string :contactperson

      t.timestamps null: false
    end
  end
end
