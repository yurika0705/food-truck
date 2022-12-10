class Location < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :address
    validates :contact_address, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
  end
  
end
