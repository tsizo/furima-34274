class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    
  end
  def new
  @item = Item.new
  end
 def create
  @item=Item.new(item_params)
  if @item.save
    redirect_to root_path(@item)
  else
   render :new
  end
end
private

def item_params
  params.require(:item).permit(:name,:image,:introduction,:category_id, :status_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :price).merge(user_id: current_user.id)
end
end
