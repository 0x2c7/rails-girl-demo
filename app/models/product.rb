class Product < ApplicationRecord
  validates :name, presence: true, length: {in: 5..255}
  validates :brand, presence: true, length: {in: 5..100}
  validates :price, inclusion: 1..1000000000
  validates  :image, presence: true
end
