class ArticleGroup < ActiveRecord::Base
  has_many :articles, inverse_of: :article_group

  validates :code, presence: true, uniqueness: true
  validates :name, presence: false

  def display_name
    "#{code}/#{name}"
  end
end
