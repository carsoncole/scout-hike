class User < ApplicationRecord
  include Clearance::User
  belongs_to :unit
  has_many :treks
  validates :screenname, length: { maximum: 50 }

  validates :screenname, presence: true
  validates :screenname, uniqueness: true
end
