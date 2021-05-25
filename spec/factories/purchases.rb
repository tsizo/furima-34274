FactoryBot.define do
  factory :purchase do
   post_code    {123-4567}
   prefecture_id{2}
   city         {'wed'} 
   address      {'edf'}
   phone_number {12345678912} 
  end
end
