FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    birth_day             {'2021-09-09'}
    family_name           {'田中'}
    first_name            {'太郎'}
    family_name_kana      {'タナカ'}
    first_name_kana       {'タロウ'}
  end
end