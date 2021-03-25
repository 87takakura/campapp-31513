class Article < ApplicationRecord

belongs_to :user
has_many :comments
has_many :chats
validates :name, presence: true
end