class Customer < ActiveRecord::Base
  has_many :production_orders, inverse_of: :customer

  def display_name
    "#{code} - #{name1}"
  end

end
