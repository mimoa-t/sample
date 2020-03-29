class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postcode, :address, :prefecture, :municipality, presence: true
end
