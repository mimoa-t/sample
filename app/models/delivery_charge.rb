class DeliveryCharge < ApplicationRecord
  has_many :delivery_methods
  has_many :products
end
