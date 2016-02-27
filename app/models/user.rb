class User < ActiveRecord::Base
  has_many :production_orders
  has_many :favorite_production_orders
  has_many :favorites, through: :favorite_production_orders, source: :production_order
  has_many :production_records, inverse_of: :user
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true


  def has_started_record
    ProductionRecord.where("user_id = ? AND finish IS NULL", id).count() > 0
  end

end
