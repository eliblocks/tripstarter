class Trip < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: :requester_id

  validates :title, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :departing_at, presence: true
end
