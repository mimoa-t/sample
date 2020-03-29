# メルカリデータベース設計
## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|familyname|string|null: false|
|familyname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|birthday|string|null: false|
|cellphone|string|null: false|
|phone|string||
|profile|text||
|profile-image|text||
### association
- has_many :products
- has_many :comments
- has_many :users_rates
- has_many :likes
- has_one :address
- has_one :card


## products
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|
|description|text|null: false|
|state|string|null: false|
|price|string|null: false|
|delivery-charge|string|null: false|
|delivery-method|string|null: false|
|delivery-area|string|null: false|
|delivery-date|string|null: false|
|category|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|brand|reference|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :comments
- has_many :likes
- has_many :images

## likes
|Column|Type|Options|
|------|----|-------|
|user|reference||null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
### assosiation 
- belongs_to :user
- belongs_to :product

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### association
- has_many :products
- has_ancestry

## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### association
- has_many :products

## comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :product

## addresses
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|adress|string|null: false|
|building|string||
|user|refarence|null: false, foreign_key: true|
### association
- belongs_to :user

## images
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product|refarence|null: false, foreign_key: true|
### association
- belongs_to :product

## cards
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_cord|integer|null: false|
|user|refarence|null: false, foreign_key: true|
### association
- belongs_to :user
