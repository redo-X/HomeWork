class CreateProductionWorkSteps < ActiveRecord::Migration
  def change
    create_table :production_work_steps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
