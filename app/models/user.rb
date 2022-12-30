class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :locations
  has_many :event_users
  has_many :events, through: :event_users
  # nameカラムのバリデーションを追加
  validates :name, presence: true
end
