class Trek < ApplicationRecord
  belongs_to :user
  after_save :update_miles_count!
  after_destroy :update_miles_count!

  def update_miles_count!
    user.update(miles_count: user.treks.sum(:distance_in_miles))
  end
end
