class Article < ApplicationRecord
  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
end
