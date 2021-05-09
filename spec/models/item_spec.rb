require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe'出品機能' do
  context'出品できるとき'do
  it'全ての項目を入力すれば登録できる'do
  expect(@item).to be_valid
end
end
context'出品できないとき' do
it"nameが空だと出品できない"do
@item.name =''
@item.valid?
expect(@item.errors.full_messages).to include("Name can't be blank")
end
it"categoryが空だと出品できない"do
@item.category_id =''
@item.valid?
expect(@item.errors.full_messages).to include("Category can't be blank")
end
it"statusが空だと出品できない"do
@item.status_id =''
@item.valid?
expect(@item.errors.full_messages).to include("Status can't be blank")
end
it"shipping_costが空だと出品できない"do
@item.shipping_cost_id =''
@item.valid?
expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
end
it"shipping_daysが空だと出品できない"do
@item.shipping_days_id =''
@item.valid?
expect(@item.errors.full_messages).to include("Shipping days can't be blank")
end
it"prefectureが空だと出品できない"do
@item.prefecture_id =''
@item.valid?
expect(@item.errors.full_messages).to include("Prefecture can't be blank")
end
it"priceが空だと出品できない"do
@item.price=''
@item.valid?
expect(@item.errors.full_messages).to include("Price can't be blank")
end
it'priceが全角数字だと出品できない'do
@item.price = '１２３４５'
@item.valid?
expect(@item.errors.full_messages).to include("Price is not a number")
end
it'priceが¥300〜9,999,999に収まっていないと出品できない'do
@item.price = '299'
@item.valid?
expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
end
it"introductionが空だと出品できない"do
@item.introduction =''
@item.valid?
expect(@item.errors.full_messages).to include("Introduction can't be blank")
end
it'imageが空だと出品できない' do
@item.image = nil
@item.valid?
expect(@item.errors.full_messages).to include("Image can't be blank")
end
it '紐づくユーザーが存在しないと保存できないこと' do
  @item.user = nil
  @item.valid?
  expect(@item.errors.full_messages).to include('User must exist')
end
end
end
end


