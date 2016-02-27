class ProductionRecord < ActiveRecord::Base
  belongs_to :production_order, inverse_of: :production_records
  belongs_to :production_work_step, inverse_of: :production_records
  belongs_to :user, inverse_of: :production_records

  def duration_in_minutes
    TimeDifference.between(start, finish_or_now).in_minutes
  end

  def is_finished
    finish != nil
  end

  def finish_or_now
    finish.presence || Time.now
  end

end
