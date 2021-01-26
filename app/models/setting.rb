class Setting < ApplicationRecord
  def self.start_date
    first&.start_date
  end

  def self.end_date
    first&.end_date
  end

  def self.active?
    first&.start_date && first.start_date < Time.now && first.end_date > Time.now
  end
end
