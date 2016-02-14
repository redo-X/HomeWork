class ProductionOrder < ActiveRecord::Base
  belongs_to :article, inverse_of: :productionorders
  belongs_to :customer, inverse_of: :productionorders

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
end
