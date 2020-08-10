class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,     presence: true

  validates :password,     format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: "パスワードには英字と数字を混ぜてください"}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を使用してください" } do
    validates :second_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: "全角カタカナを使用してください"} do
    validates :second_kana
    validates :first_kana
  end

  validates :birthday,     presence: true
end
