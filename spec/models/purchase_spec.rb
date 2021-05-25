require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
end
    describe"購入機能" do
     context"購入できる時" do
      it"全ての項目を入力すると登録できる"do
      expect(:@purchase).to be_valid
     end
    end
     context"購入できない時"do
      it"post_codeがないと購入できない"do
      @purchase.post_code = ''
      expect(@purchase.errors.full_message).to include("Post Code can't be blank")
      end
      
      it"post_codeにハイフンがないと購入できない"do
      @purchase.post_code = '4320987'
      expect(@purchase.errors.full_message).to include("Post Code can't be blank")
      end


      it"prefecture_idがないと購入できない"do
      @purchase.prefecture_id = ''
      expect(@purchase.errors.full_message).to include("Prefecture can't be blank")
      end

      it"cityがないと購入できない"do
      @purchase.city = ''
      expect(@purchase.errors.full_message).to include("City can't be blank")
      end

      it"addressがないと購入できない"do
      @purchase.address = ''
      expect(@purchase.errors.full_message).to include("Address can't be blank")
      end

      it"phone_numberがないと購入できない"do
      @purchase.phone_number = ''
      expect(@purchase.errors.full_message).to include("Phone Number can't be blank")
      end

      it"phone_numberが12桁以上だと購入できない" do
      @purchase.phone_number = '12345612342345'
      expect(@purchase.errors.full_message).to include("Phone Number can't be blank")
      end

      it"phone_numberが半角英数混合だと購入できない" do
      @purchase.phone_number = 'as34561234'
      expect(@purchase.errors.full_message).to include("Phone Number can't be blank")
      end
      it"phone_numberが半角英語だと購入できない" do
      @purchase.phone_number = 'asdesfasdef'
      expect(@purchase.errors.full_message).to include("Phone Number can't be blank")
      end
     end
   end







