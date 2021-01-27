class User < ApplicationRecord
  include Clearance::User
  belongs_to :unit
  has_many :treks
  validates :screenname, length: { maximum: 50 }

  validates :screenname, presence: true
  validates :screenname, uniqueness: true

  scope :ranked, -> { order(miles_count: :desc) }

  def percentage_of_goal
    if unit.miles_goal & unit.miles_goal > 0
      miles_count / unit.miles_goal * 100.00
    else
      0
    end
  end
end
