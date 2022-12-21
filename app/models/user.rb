class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :locations
  has_many :events
  # nameカラムのバリデーションを追加
  validates :name, presence: true
end
