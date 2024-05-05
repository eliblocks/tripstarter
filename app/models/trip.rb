class Trip < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: :requester_id
  belongs_to :driver, class_name: "User", foreign_key: :driver_id, optional: true
  has_many :rides
  has_many :riders, through: :rides, source: "user"

  validates :title, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :departing_at, presence: true

  def status
    driver ? 'Scheduled' : 'Pending'
  end

  def status_color
    status == "Pending" ? "text-warning" : "text-success"
  end
end
