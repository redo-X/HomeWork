class CreateWorkSteps < ActiveRecord::Migration
  def change
    create_table :work_steps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
