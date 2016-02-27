class ProductionOrder < ActiveRecord::Base
  belongs_to :article, inverse_of: :productionorders
  belongs_to :customer, inverse_of: :productionorders
  belongs_to :work_plan, inverse_of: :production_orders

  belongs_to :user
  has_many :favorite_production_orders
  has_many :favorited_by, through: :favorite_production_orders, source: :user

  has_many :production_work_steps, inverse_of: :production_order
  has_many :production_order_attachments, inverse_of: :production_order
  has_many :production_records, inverse_of: :production_order

  validates :number, presence: true, uniqueness: true
  validates :description, presence: false

  validates :article, presence: true

  validates :release_date, presence: true
  validates :due_date, presence: true

  validate :checkDueDate

  def checkDueDate
    if due_date < release_date
      errors.add(:due_date, "muss größer als das Freigabedatum sein")
    end
  end

  def display_name
    "#{number}"
  end
end
