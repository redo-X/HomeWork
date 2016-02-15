class ProductionWorkStep < ActiveRecord::Base
  belongs_to :production_order, inverse_of: :production_work_steps
end
