FactoryBot.define do
  factory :purchase_address do
    post_code    {'123-4567'}
    prefecture_id{2}
    city         {'wed'} 
    address      {'edf'}
    building_name { '横浜' }
    phone_number {12345678912} 
    token {"tokeert0987"} 
  end
end
