class AddReferenceProductionOrdersWorkPlan < ActiveRecord::Migration
  def change
    add_reference :production_orders, :work_plan, index: true, foreign_key: true
  end
end
