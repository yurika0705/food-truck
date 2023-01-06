class Location < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュ とのアソシエーション
  belongs_to_active_hash :prefecture
  # テーブルとのアソシエーション
  belongs_to :user
  has_many :events, dependent: :destroy
  # アクティブストレージとのアソシエーション
  has_one_attached :image

  with_options presence: true do
    validates :place
    validates :address
    validates :contact_address, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    # prefectureの選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
  end

  # addressから自動で緯度と経度のカラムに値を代入する
  geocoded_by :address
  after_validation :geocode
end
