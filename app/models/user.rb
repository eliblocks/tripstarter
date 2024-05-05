class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requested_trips, class_name: "Trip", foreign_key: :requester_id
  has_many :rides
  has_many :trips, through: :rides

  def initials
    name.split.map { |name| name[0] }.join("")
  end

  def joined_trips
    ids = rides.joined.pluck(:trip_id)
    Trip.where(id: ids)
  end

  def driver?
    driver_status == "active"
  end
end
