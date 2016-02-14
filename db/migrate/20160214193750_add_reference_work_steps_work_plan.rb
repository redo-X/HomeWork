class AddReferenceWorkStepsWorkPlan < ActiveRecord::Migration
  def change
    add_reference :work_steps, :work_plan, index: true, foreign_key: true
  end
end
