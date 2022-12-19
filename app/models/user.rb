class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :locations
  has_many :calenders
  # nameカラムのバリデーションを追加
  validates :name, presence: true
end
