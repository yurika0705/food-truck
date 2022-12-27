class Location < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_many :events
  has_one_attached :image

  with_options presence: true do
    validates :place
    validates :address
    validates :contact_address, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :prefecture_id
  end
  # prefectureの選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_then: 1 , message: "can't be blank" }
  # addressから自動で緯度と経度のカラムに値を代入する
  geocoded_by :address
  after_validation :geocode

end
