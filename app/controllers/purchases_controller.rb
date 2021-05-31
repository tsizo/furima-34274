class PurchasesController < ApplicationController
 before_action :authenticate_user!, only: [:index,:create]
 before_action :set_purchase,       only: [:index,:create]
 before_action :move_to_root_path,  only: [:index,:create]
  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path  
    else
      render :index
    end  
  end  
private
  def purchase_params
    params.require(:purchase_address).permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end 

  def move_to_root_path
    if current_user== @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end

end
 

