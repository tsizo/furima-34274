class User < ApplicationRecord
with_options presence:true do
 validates :nickname
 validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
 validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
 validates :family_name_kana,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :first_name_kana,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :birth_day
 validates :encrypted_password, length:{minimum:6}
end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end       

