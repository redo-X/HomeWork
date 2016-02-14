class CreateArticleGroups < ActiveRecord::Migration
  def change
    create_table :article_groups do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
