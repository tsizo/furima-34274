class User < ApplicationRecord
with_options presence:true do
 validates :nickname
 validates :family_name, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :first_name, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :family_name_kana,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :first_name_kana,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :birth_day
 validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end       
