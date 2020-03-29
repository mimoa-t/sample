class DeliveryMethod < ApplicationRecord
  belongs_to :delivery_charge
  has_many :products
end
