FactoryBot.define do
  factory :item do
    name              {'ssss'}
    category_id       {2}
    status_id         {2}
    shipping_cost_id  {2}
    shipping_day_id  {2}
    prefecture_id     {2}
    price             {12345}
    introduction      {'asd'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/comment.png'), filename: 'comment.png', content_type: 'image/png')
    end
  end
end
