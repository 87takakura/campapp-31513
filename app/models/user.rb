class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def update_without_current_password(params, *options)
          params.delete(:current_password)
      
          if params[:password].blank? && params[:password_confirmation].blank?
            params.delete(:password)
            params.delete(:password_confirmation)
          end
      
          result = update_attributes(params, *options)
          clean_up_passwords
          result
        end
            
  
 has_many :campposts, dependent: :destroy
 has_many :comments, dependent: :destroy      
 has_many :chats, dependent: :destroy

 belongs_to :prefecture

 has_one_attached :image

 validates :username, presence: true
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

 # validates :email, uniqueness: true
 # validates :encrypted_password, uniqueness: true


end
