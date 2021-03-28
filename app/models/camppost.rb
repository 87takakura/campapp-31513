class Camppost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  #has_many :comments
  #has_many :chats
  has_one_attached :image

  belongs_to :prefecture
  belongs_to :watersupply
  belongs_to :outlet
  belongs_to :toilet
  belongs_to :bath
  belongs_to :parking

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :watersupply_id, numericality: { other_than: 1 }
  validates :outlet_id, numericality: { other_than: 1 }
  validates :toilet_id, numericality: { other_than: 1 }
  validates :bath_id, numericality: { other_than: 1 }
  validates :parking_id, numericality: { other_than: 1 }


end
