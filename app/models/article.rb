class Article < ActiveRecord::Base
  has_many :production_orders, inverse_of: :article
  belongs_to :article_group, inverse_of: :articles


  validates :code, presence: true, uniqueness: {scope: [:code, :version]}
  validates :name, presence: true
  validates :article_group, presence: true
  validates :version, presence: true, uniqueness: {scope: [:code, :version]}

  def self.harnesses
    joins(:article_group).where('article_groups.code = ?', 500)
  end

  def display_name
    "#{code} - #{name}"
  end
end
