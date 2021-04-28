require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録"  do
    it"nicknameが空だと登録できない"do
    user = User.new(nickname: "", email: "email:ttt@gmail.com", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "ヤマダ",first_name: "太郎",first_name_kana: "タロウ",birth_day: "2021-01-03")
   user.valid?
   expect(user.errors.full_messages).to include("Nickname can't be blank")
  end
  it"emailが空だと登録できない"do
  user = User.new(email: "", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "ヤマダ", first_name: "太郎",first_name_kana: "タロウ",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("Email can't be blank") 
end
it"passwordが空だと登録できない"do
  user = User.new(email:"ttt@gmail.com", nickname:"tt", password:"", password_confirmation:"000000",family_name:"山田",family_name_kana:"ヤマダ",first_name:"太郎",first_name_kana:"タロウ",birth_day:"2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("Password can't be blank") 
end
it"password_confirmaitionが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "",family_name: "山田",family_name_kana: "ヤマダ",first_name: "太郎",first_name_kana: "タロウ",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("Password_Confirmaition can't be blank") 
end
it"family_nameが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "",family_name_kana: "ヤマダ",first_name: "太郎",first_name_kana: "タロウ",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("Family_name can't be blank") 
end
it"family_name_kanaが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "",first_name: "太郎",first_name_kana: "タロウ",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("Family_name_kana can't be blank") 
end
it"first_nameが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "ヤマダ",first_name: "",first_name_kana: "タロウ",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("First_name can't be blank") 
end
it"first_name_kanaが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "ヤマダ",first_name: "太郎",first_name_kana: "",birth_day: "2021-01-03")
 user.valid?
 expect(user.errors.full_messages).to include("First_name_kana can't be blank") 
end
it"birth_dayが空だと登録できない"do
  user = User.new(email: "ttt@gmail.com", nickname: "tt", password: "000000", password_confirmation: "000000",family_name: "山田",family_name_kana: "ヤマダ",first_name: "太郎",first_name_kana: "タロウ",birth_day:" ")
 user.valid?
 expect(user.errors.full_messages).to include("Birth_day can't be blank") 
end
end
end






