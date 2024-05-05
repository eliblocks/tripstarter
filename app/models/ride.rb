class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :trip, uniqueness: { scope: :user }

  scope :joined, -> { where(status: :joined) }
end
