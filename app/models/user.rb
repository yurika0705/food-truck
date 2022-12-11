class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :locations
  # nameカラムのバリデーションを追加
  validates :name, presence: true
end
