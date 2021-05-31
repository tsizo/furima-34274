require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item) 
  @purchase = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  sleep 0.5
  end
    describe"購入機能" do
     context"購入できる時" do
      it"全ての項目を入力すると登録できる"do
      expect(@purchase).to be_valid
     end
     it '建物名がなくても購入できること' do
      @purchase.building_name = ''
      expect(@purchase).to be_valid
     end
    end
     context"購入できない時"do

     it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
      
     it"post_codeがないと購入できない"do
      @purchase.post_code = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      
      it"post_codeにハイフンがないと購入できない"do
      @purchase.post_code = '4320987'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end


      it"prefecture_idがないと購入できない"do
      @purchase.prefecture_id = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it"cityがないと購入できない"do
      @purchase.city = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it"addressがないと購入できない"do
      @purchase.address = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end

      it"phone_numberがないと購入できない"do
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it"phone_numberが12桁以上だと購入できない" do
      @purchase.phone_number = '12345612342345'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it"phone_numberが半角英数混合だと購入できない" do
      @purchase.phone_number = 'as34561234'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it"phone_numberが全角数字だと登録できないこと" do
        @purchase.phone_number = '１２３４５６７８９１２'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid") 
      end  
      
      it"phone_numberが半角英語だと購入できない" do
      @purchase.phone_number = 'asdesfasdef'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
     end
   end
  end













