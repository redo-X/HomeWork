class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :code
      t.string :name
      t.string :version

      t.timestamps null: false
    end
  end
end
