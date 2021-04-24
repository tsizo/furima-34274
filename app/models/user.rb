class User < ApplicationRecord
 validates :nickname, presense:true
 validates :family_name, presense:true
 validates :first_name, presense:true
 validates :family_name_kana, presense:true
 validates :first_name_kana, presense:true
 validates :birth_day, presense:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
