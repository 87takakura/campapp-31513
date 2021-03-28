class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
 has_many :campposts, dependent: :destroy
 #has_many :comments         
 #has_many :chats
         
  

 has_one_attached :iamge

 validates :username, presence: true
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

 # validates :email, uniqueness: true
 # validates :encrypted_password, uniqueness: true

 validates :birthday, presence: true

 with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
   validates :firstname
   validates :lastname
 end

 with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
   validates :katakanafirstname
   validates :katakanalastname
 end
end