class PurchasesController < ApplicationController
  def index
    @purchases = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchases = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchases.valid?
      @purchases.save
      redirect_to root_path  
    else
      render :index
    end  
  end  
private
  def purchase_params
    params.permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
 

