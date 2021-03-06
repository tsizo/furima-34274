class User < ApplicationRecord
 with_options presence:true do
 validates :nickname
 validates :birth_day
 with_options format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
 validates :family_name
 validates :first_name
 with_options format:{with:/\A[ァ-ヶー－]+\z/} do
validates :family_name_kana
 validates :first_name_kana
 end
 end
end
validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end       

