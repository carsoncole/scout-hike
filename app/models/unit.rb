class Unit < ApplicationRecord
  validates :name, :start_date, :end_date, :miles_goal, presence: true

  def active?
    start_date && start_date < Time.now && end_date > Time.now
  end
end
