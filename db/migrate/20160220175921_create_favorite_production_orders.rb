class CreateFavoriteProductionOrders < ActiveRecord::Migration
  def change
    create_table :favorite_production_orders do |t|
      t.integer :production_order_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
