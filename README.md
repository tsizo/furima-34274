## usersテーブル
  |colum             |type   |options    |
  |------------------|-------|-----------|
  |nickname          |string |null:false |
  |email             |string |unique:true|
  |encrypted_password|string |null:false |
  |birth_day         |date   |mull:false |
  |family_name       |string |null:false |
  |first_name        |string |null:false |
  |family_name_kana  |string |null:false |
  |first_name_kana   |string |null:false |
 
  
  ### Association

- has_many : items
- has_many : purchases



## itemsテーブル

  | colum            |type      |options                    |
  |------------------|----------|---------------------------|
  |name              |string    |null:false                 |
  |category_id       |integer   |null:false,foreign_key:true|
  |status_id         |integer   |null:false,foreign_key:true|
  |shipping_cost_id  |integer   |mull:false,foreign_key:true|
  |shipping_days_id  |integer   |null:false,foreign_key:true|
  |prefecture_id     |integer   |null:false,foreign_key:true|
  |price             |integer   |null:false,foreign_key:true|
  |user              |references|null:false,foreign_key:true|
  ### Association
-  belongs_to :user
-  has_one : purchase

## addressesテーブル
  | colum            |type     |options                     |
  |------------------|-------  |----------------------------|
  |post_code         |string   |null:false                  |
  |prefecture_id     |integer  |null:false,foreign_key:true |
  |city              |string   |null:false                  |
  |address           |string   |mull:false                  |
  |building_name     |string   |                            |
  |phone_number      |string   |null:false                  |
  |purchase          |references|null:false,foreign_key:true|     
  ### Association
  - belongs_to : purchase
  

  ## purchasesテーブル
  | colum            |type      |options                    |
  |------------------|----------|---------------------------|
  |user              |references|null:false,foreign_key:true|
  |item              |references|null:false,foreign_key:true|
  
### Association
- belongs_to : user
- has_one : address
- belongs_to : item