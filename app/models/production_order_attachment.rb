class ProductionOrderAttachment < ActiveRecord::Base
  belongs_to :production_order, inverse_of: :production_order_attachments
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
end