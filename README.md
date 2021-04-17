## usersテーブル
  |colum             |type   |options    |
  |------------------|-------|-----------|
  |nickname          |string |null:false |
  |e-mail            |string |null:false |
  |encrypted_password|string |null:false |
  |birth_day         |date   |mull:false |
  |family_name       |string |null:false |
  |first_name        |string |null:false |
  |family_name_kana  |string |null:false |
  |first_name_kana   |string |null:false |
 
  
  ### Association

- has_many : items
- belongs_to : address


## itemsテーブル

  | colum            |type   |options    |
  |------------------|-------|-----------|
  |name              |string |null:false |
  |category          |string |null:false |
  |status            |string |null:false |
  |shipping_cost     |string |mull:false |
  |shipping_days     |string |null:false |
  |prefecture        |string |null:false |
  |price             |integer|null:false
  ### Association
-  belongs_to :user

## addressesテーブル
  | colum            |type   |options    |
  |------------------|-------|-----------|
  |post_code         |string |null:false |
  |prefecture        |string |null:false |
  |city              |string |null:false |
  |address           |string |mull:false |
  |building_name     |string |           |
  |phone_number      |string |null:false |
  
  ### Association
  - belongs_to : user
