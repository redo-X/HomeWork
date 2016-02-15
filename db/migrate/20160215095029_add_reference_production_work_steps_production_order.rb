class AddReferenceProductionWorkStepsProductionOrder < ActiveRecord::Migration
  def change
    add_reference :production_work_steps, :production_order, index: true, foreign_key: true
  end
end
