class WorkStep < ActiveRecord::Base
  belongs_to :work_plan, inverse_of: :work_steps
end
