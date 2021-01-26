class Setting < ApplicationRecord
  def self.start_date
    all.first&.start_date
  end

  def self.end_date
    all.first&.end_date
  end
end
