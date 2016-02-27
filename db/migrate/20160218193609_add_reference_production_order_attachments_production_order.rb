class AddReferenceProductionOrderAttachmentsProductionOrder < ActiveRecord::Migration
  def change
    add_reference :production_order_attachments, :production_order, index: true, foreign_key: true
  end
end
