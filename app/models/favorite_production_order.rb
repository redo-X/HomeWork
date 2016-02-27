class FavoriteProductionOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :production_order
end
