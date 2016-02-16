class CreateProductionOrderAttachments < ActiveRecord::Migration
  def change
    create_table :production_order_attachments do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
