class CreateWorkPlans < ActiveRecord::Migration
  def change
    create_table :work_plans do |t|
      t.string :name
      t.string :description
      t.boolean :is_standard

      t.timestamps null: false
    end
  end
end
