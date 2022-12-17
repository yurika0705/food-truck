class Calender < ApplicationRecord
  has_many :users
  has_many :locations

  with_options presence: true do
    validates :start_time
    validates :user_id
    validates :location_id
    validates :store_name
  end
end
