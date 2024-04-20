class Trip < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: :requester_id
end
