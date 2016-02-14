class CreateProductionOrders < ActiveRecord::Migration
  def change
    create_table :production_orders do |t|
      t.integer :number
      t.string :description
      t.integer :quantity
      t.integer :pending_quantity
      t.date :release_date
      t.date :due_date
      t.boolean :isCompleted

      t.timestamps null: false

      t.belongs_to :article, index: true
    end
  end
end
