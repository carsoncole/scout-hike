class Unit < ApplicationRecord
  validates :name, :start_date, :end_date, :miles_goal, presence: true

  def active?
    start_date && start_date < Time.now + 8.hours && end_date + 8.hours > Time.now
  end
end
