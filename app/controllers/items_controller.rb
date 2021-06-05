class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit, :update, :destroy]
  before_action :set_item,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit,:update,:destroy]
  
  def index
    @items = Item.all.includes(:user).order("created_at DESC") 
  end

  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
   if @item.save
    redirect_to root_path
  else
    render :new
   end
  end

  def show
  end
  
  def edit
  end  
  
  def update
   if @item.update(item_params)
    redirect_to item_path(@item.id)
   else
    render :edit
   end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end 
  end
  private

  def item_params
    params.require(:item).permit(:name,:image,:introduction,:category_id, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless current_user.id == @item.user_id && @item.purchase.nil?
      redirect_to action: :index
    end
  end 
end
