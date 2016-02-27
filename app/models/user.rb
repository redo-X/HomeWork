class User < ActiveRecord::Base
  has_many :production_orders
  has_many :favorite_production_orders
  has_many :favorites, through: :favorite_production_orders, source: :production_order
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable


  def has_started_record
    ProductionRecord.where("user_id = ? AND finish IS NULL", id).count() > 0
  end

end
