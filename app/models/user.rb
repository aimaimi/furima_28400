class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  katakana = /\A[ァ-ン]+\z/
  alphanumeric = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, format: { with: alphanumeric, message: 'には英字と数字を混ぜてください' }

  with_options presence: true, format: { with: zenkaku, message: 'には全角文字を使用してください' } do
    validates :second_name
    validates :first_name
  end

  with_options presence: true, format: { with: katakana, message: 'には全角カタカナを使用してください' } do
    validates :second_kana
    validates :first_kana
  end
end
