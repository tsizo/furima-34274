require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録"  do
  context '新規登録できる時' do 
  it '全ての項目を入力すれば登録できる'do
  expect(@user).to be_valid
  end
  it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
  @user.password ='aaaaaa'
  @user.password_confirmation = 'aaaaaa'
  expect(@user).to be_valid
  end 
  end
context '新規登録できない時' do
it"nicknameが空だと登録できない"do
@user.nickname =''
@user.valid?
expect(@user.errors.full_messages).to include("Nickname can't be blank")
end
it"emailが空だと登録できない"do
@user.email =''
@user.valid?
expect(@user.errors.full_messages).to include("Email can't be blank") 
end
it"passwordが空だと登録できない"do
@user.password =''
 @user.valid?
 expect(@user.errors.full_messages).to include("Password can't be blank") 
end
it"password_confirmaitionが空だと登録できない"do
@user.password_confirmation =''
@user.valid?
expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
end
it"family_nameが空だと登録できない"do
@user.family_name =''
@user.valid?
expect(@user.errors.full_messages).to include("Family name can't be blank") 
end
it"family_name_kanaが空だと登録できない"do
@user.family_name_kana =''
@user.valid?
expect(@user.errors.full_messages).to include("Family name kana can't be blank") 
end
it"first_nameが空だと登録できない"do
@user.first_name =''
@user.valid?
expect(@user.errors.full_messages).to include("First name can't be blank") 
end
it"first_name_kanaが空だと登録できない"do
@user.first_name_kana =''
@user.valid?
expect(@user.errors.full_messages).to include("First name kana can't be blank") 
end
it"birth_dayが空だと登録できない"do
@user.birth_day = ''
 @user.valid?
 expect(@user.errors.full_messages).to include("Birth day can't be blank") 
end
it '重複したemailが存在する場合登録できないこと' do
  @user.save
  another_user = FactoryBot.build(:user, email: @user.email)
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end
it "emailが＠を含まないと登録できない"do
@user.email='testexample'
@user.valid?
expect(@user.errors.full_messages).to include("Email is invalid")
end
it 'passwordが５文字以下であれば登録できないこと' do
  @user.password = '12345'
  @user.password_confirmation = '12345'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
end
it'passwordは半角英数字混合でないと登録できないこと'do
@user.password = '１２３４５６'
@user.valid?
expect(@user.errors.full_messages).to include("Password is invalid")
end
it 'family_nameが全角入力でなければ登録できないこと' do
  @user.family_name ="aiueo"
  @user.valid?
  expect(@user.errors.full_messages).to include("Family name is invalid")
end

it 'first_nameが全角入力でなければ登録できないこと' do
  @user.first_name="ｱｲｳｴｵ"
  @user.valid?
  expect(@user.errors.full_messages).to include("First name is invalid")
end

it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
  @user.family_name_kana="あいうえお"
  @user.valid?
  expect(@user.errors.full_messages).to include("Family name kana is invalid")
end

it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
  @user.first_name_kana="あいうえお"
 @user.valid?
  expect(@user.errors.full_messages).to include("First name kana is invalid")
end
it "passwordが英語のみでは登録できない" do
  @user.password = "aaaaaa"
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it "passwordが数字のみでは登録できない" do
    @user.password = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが全角のみでは登録できない" do
   @user.password = "１２３４５６"
  @user.valid?
expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
 end  
end
end
end






