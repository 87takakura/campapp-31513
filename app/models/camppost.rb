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
  belongs_to :fire
  belongs_to :cargetin

  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    validates :city
  end




  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
    validates :watersupply_id
    validates :outlet_id
    validates :toilet_id
    validates :bath_id
    validates :parking_id
    validates :fire_id
    validates :cargetin_id
  end

end
