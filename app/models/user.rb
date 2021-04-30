class User < ApplicationRecord
 validates :nickname, presence:true
 validates :family_name, presence:true,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
 validates :first_name, presence:true,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
 validates :family_name_kana, presence:true,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :first_name_kana, presence:true,format:{with:/\A[ァ-ヶー－]+\z/}
 validates :birth_day, presence:true
 validates :encrypted_password,presence:true, length:{minimum:6}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
