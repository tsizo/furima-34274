class ShippingDay < ActiveHash::Base
  self.data=[{ id: 1,shipping_days: '--' },
    { id: 2, shipping_days:  '1~2日で発送' },
    { id: 3, shipping_days:  '2~3日で発送'},
    {id: 4,shipping_days:  '3~4日で発送'}
  ]
  include ActiveHash::Associations
  has_many:items
end