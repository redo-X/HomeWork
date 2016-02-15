class WorkPlan < ActiveRecord::Base
  has_many :work_steps, inverse_of: :work_plan
  has_many :production_orders, inverse_of: :work_plan
end
