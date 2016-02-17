class CreateProductionRecords < ActiveRecord::Migration
  def change
    create_table :production_records do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
