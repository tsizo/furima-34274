class Item < ApplicationRecord
  
  with_options presence:true do
  validates :name
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_days_id
  validates :prefecture_id
  validates :price,format:{with:/\A[0-9]+\z/}
  validates :introduction
  validates :user
  validates :genre_id, numericality: { other_than: 1 } 
  end

  
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :genre
has_one_attached :image
end
