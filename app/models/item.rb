class Item < ApplicationRecord
  
  with_options presence:true do
  validates :name,length:{maximum: 40}
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_days_id
  validates :prefecture_id
  validates :price,format:{with:/\A[0-9]+\z/},numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  validates :introduction,length:{maximum: 1000}
  validates :user
  end

  
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :status
belongs_to :shipping_day
belongs_to :shipping_cost
belongs_to :category
belongs_to :prefecture
belongs_to :user
has_one_attached :image
end
