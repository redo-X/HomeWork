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

  # dm: Der Benutzer soll nur einer Rolle zugeordnet werden
  def role
    roles.first
  end

  def role_id
    role.try(:id)
  end

  def set_new_role(role)
    if not roles.include?(role)
      if roles.count() > 0
        roles.destroy_all
      end

      roles << role
    end
  end
end
