class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location

  with_options presence: true do
    validates :title
    validates :start_time
    validates :user_id
    validates :location_id
  end
end
