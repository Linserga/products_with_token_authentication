class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :quantity, presence: true, numericality: true
  validates :price, presence: true, numericality: true
end
