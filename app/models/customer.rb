class Customer < ActiveRecord::Base
  has_many :production_orders, inverse_of: :customer
end
