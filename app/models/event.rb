class Event < ApplicationRecord
  belongs_to :location
  has_many :event_users
  has_many :users, through: :event_users

  with_options presence: true do
    validates :title
    validates :start_time
    validates :user_id
    validates :location_id
  end
end
