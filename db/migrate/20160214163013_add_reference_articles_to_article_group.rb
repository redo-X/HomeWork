class AddReferenceArticlesToArticleGroup < ActiveRecord::Migration
  def change
    add_reference :articles, :article_group, index: true, foreign_key: true
  end
end
