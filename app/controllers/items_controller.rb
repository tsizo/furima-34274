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
    render:root_path
  else
   render:@item 
  end
end
private

def item_params
  params.require(:user).permit(:nickname, :birth_day, :first_name, :family_name, :first_name_kana, :family_name_kana).merge(user_id:current_user.id)
end
end
