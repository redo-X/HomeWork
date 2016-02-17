class AddReferencesProductionRecordsUserProductionOrder < ActiveRecord::Migration
  def change
    add_reference :production_records, :production_order, index: true, foreign_key: true
    add_reference :production_records, :production_work_step, index: true, foreign_key: true
    add_reference :production_records, :user, index: true, foreign_key: true
  end
end
