class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def create
  end  
end
private
  def purchase_params
    params.permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number)
  end
