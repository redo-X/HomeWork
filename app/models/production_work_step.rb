class ProductionWorkStep < ActiveRecord::Base
  belongs_to :production_order, inverse_of: :production_work_steps

  has_many :production_records, inverse_of: :production_work_step
end
