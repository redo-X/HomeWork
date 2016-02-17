class ProductionRecord < ActiveRecord::Base
  belongs_to :production_order, inverse_of: :production_records
  belongs_to :production_work_step, inverse_of: :production_records
  belongs_to :user, inverse_of: :production_records
end
