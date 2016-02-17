class Customer < ActiveRecord::Base
  has_many :production_orders, inverse_of: :customer

  validates :name1, presence: true

  def display_name
    "#{code} - #{name1}"
  end

end
